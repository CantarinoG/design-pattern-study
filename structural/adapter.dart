//Target interface
//What the client must consume
abstract class ITarget {
  double getDistanceInKM();
}

//Adaptee
//What I have to work with
class Adaptee {
  double getDistanceInMiles() {
    return 10;
  }
}

//Adapter
//The class that implement the target interface by converting the adaptee class in whatever the target interface needs
class Adapter implements ITarget {
  final Adaptee adaptee;
  Adapter(this.adaptee);

  @override
  double getDistanceInKM() {
    return adaptee.getDistanceInMiles() * 1.6;
  }
}

void main() {
  Adaptee adaptee = Adaptee();
  ITarget adapter = Adapter(adaptee);

  print(
      "Adaptee: ${adaptee.getDistanceInMiles()}mi"); //Adaptee gives the distance in KM, since it is not capable of converting it itself
  print(
      "Adapter: ${adapter.getDistanceInKM()}km"); //Adapter converted it to me in a way I need in my client code
}

//Another example would be the following scenario: In my client I need to work with json, but the response I get from a server is in xml.
//The class that communicates with the server would only provide xml. My adapter would receive an object of that class and convert the responses to json.
//My client code would then only use the adapter, not even realizing there is a conversion happening under the hood.
