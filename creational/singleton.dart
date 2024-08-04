//This class is a singleton, which means only one instance of it can exist.
class Singleton {
  static Singleton? _instance; //This variable holds the instance.
  String? message;

  Singleton._internal(
      this.message); //This is a private constructor, only the class will be able to instantiate itself.

  static Singleton get instance {
    //This is the method other parts of the program will use to get the instance.
    _instance ??= Singleton._internal(
        "Hello world!"); //If instance is null(it is the first time the function is being called and the instance wasn't created yet) this method creates it.
    return _instance!;
  }

  void showMessage() {
    print(message);
  }
}

void main() {
  Singleton singleton =
      Singleton.instance; //Here the instance is created and returned.
  singleton.showMessage();
  singleton = Singleton
      .instance; //Here, although I'm assigning a new value to the variable, it is receiving the exact same instance from before, since another instance cannot be possibly created.
  singleton.showMessage();
}
