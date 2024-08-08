//Imagine you have a stock market system where multiple clients are interested in the price changes of certain stocks.
//When the price of a stock changes, all interested clients (observers) should be notified and updated with the new price.

//Observer Interface
abstract class Observer {
  void update(String stockSymbol, double price);
}

//Subject(Observable) Interface
abstract class Stock {
  void attach(Observer observer);
  void detach(Observer observer);
  void notify();
}

// Concrete Subject
class ConcreteStock implements Stock {
  String _symbol;
  double _price;
  final List<Observer> _observers = [];

  ConcreteStock(this._symbol, this._price);

  String get symbol => _symbol;

  double get price => _price;

  set price(double value) {
    _price = value;
    notify();
  }

  @override
  void attach(Observer observer) {
    _observers.add(observer);
  }

  @override
  void detach(Observer observer) {
    _observers.remove(observer);
  }

  @override
  void notify() {
    for (var observer in _observers) {
      observer.update(_symbol, _price);
    }
  }
}

// Concrete Observer
class Investor implements Observer {
  String _name;

  Investor(this._name);

  @override
  void update(String stockSymbol, double price) {
    print('$_name is notified: $stockSymbol price changed to $price');
  }
}

void main() {
  var googleStock = ConcreteStock('GOOG', 1500.0);

  var investor1 = Investor('Alice');
  var investor2 = Investor('Bob');

  googleStock.attach(investor1);
  googleStock.attach(investor2);

  googleStock.price = 1520.0;
  googleStock.price = 1490.0;

  googleStock.detach(investor1);

  googleStock.price = 1510.0;
}

//Basically, if there is one object that, when one of it's attributes change, a few other objects are notified.
//The object being observed has a list of observers(which would be notified) and a notify method. When a method changes an attribute of the subject, it should also call notify(). The notify method calls the update method in each of the observers.
//Each observer has a update method, which is notified of the change and can then change the value of it's attributes or perform some kind of behaviour.
