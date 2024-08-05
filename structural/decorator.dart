//Allows me to add behavior to an object.

//Component: The interface for objects that can have responsibilities added to them dynamically.
abstract class Coffee {
  String getDescription();
  double cost();
}

//Concrete Component
class SimpleCoffee implements Coffee {
  @override
  String getDescription() {
    return "Simple coffee";
  }

  @override
  double cost() {
    return 2;
  }
}

//Decorator: Maintain a reference to a component and define an interface that conforms to the component's.
abstract class CoffeeDecorator implements Coffee {
  final Coffee coffee;
  CoffeeDecorator(this.coffee);

  @override
  String getDescription();

  @override
  double cost();
}

//Concrete Decorators: Overwrite the behaviour of my concrete component.
class MilkDecorator extends CoffeeDecorator {
  MilkDecorator(Coffee coffee) : super(coffee);

  @override
  String getDescription() {
    return "${coffee.getDescription()}, Milk";
  }

  @override
  double cost() {
    return coffee.cost() + 0.5;
  }
}

class SugarDecorator extends CoffeeDecorator {
  SugarDecorator(Coffee coffee) : super(coffee);

  @override
  String getDescription() {
    return "${coffee.getDescription()}, Sugar";
  }

  @override
  double cost() {
    return coffee.cost() + 0.2;
  }
}

void main() {
  Coffee coffee = SimpleCoffee();
  print('${coffee.getDescription()} costs \$${coffee.cost()}');
  coffee = MilkDecorator(
      coffee); //Adds milk(overwriting what is printed by the getDescription() method) and adds 0.5 to cost(overwriting what is printed by the cost() method).
  print('${coffee.getDescription()} costs \$${coffee.cost()}');
  coffee = SugarDecorator(coffee);
  print('${coffee.getDescription()} costs \$${coffee.cost()}');
  //Basically, the initial component is wrapped into an object that changes it's behaviour.
  //The client code can use both the component and the wrapper seamlessly since they both implement the same interface.
  //That's fucking genius. Would never think something like that on my own.
}
