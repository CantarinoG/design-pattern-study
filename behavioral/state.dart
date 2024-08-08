//Allows an object to change it's behaviour when it state changes.

//State Interface: Methods corresponding to the behaviours that change depending on the state.
abstract class TcpState {
  void open(TcpConnection connection);
  void close(TcpConnection connection);
}

//Concrete state
class ClosedState implements TcpState {
  void open(TcpConnection connection) {
    print("Openning connection...");
    connection.setState(OpenState());
  }

  void close(TcpConnection connection) {
    print("Connection already closed.");
  }
}

class OpenState implements TcpState {
  void open(TcpConnection connection) {
    print("Connection is already open and listening.");
  }

  void close(TcpConnection connection) {
    print("Closing connection...");
    connection.setState(ClosedState());
  }
}

//Context: The object whose behaviour changes based on state.
class TcpConnection {
  TcpState _state;

  TcpConnection(this._state);

  void setState(TcpState state) {
    this._state = state;
  }

  void open() {
    _state.open(this);
  }

  void close() {
    _state.close(this);
  }
}

void main() {
  var connection = TcpConnection(ClosedState());

  connection.close();
  connection.open();
  connection.open();
  connection.close();
}

//So, basically my context(object whose behaviour changes) has a state(which actually defines the behaviour).
//When I call open() and close(), it is actually the state methods I'm calling.
//When I call them, they actually receive the context, which is the object calling them in the first place.
//The methods may take the context and set another state to it's state.