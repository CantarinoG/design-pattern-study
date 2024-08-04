//Product
class Pizza {
  String size = "";
  String crust = "";
  List<String> toppings = [];

  @override
  String toString() {
    return "Pizza(size: $size, crust: $crust, toppings: ${toppings.join(", ")})";
  }
}

//Builder
abstract class PizzaBuilder {
  //Having an abstract PizzaBuilder class allow me to create different builders that handle things differently.
//I could have a vegetarianPizzaBuilder, that would not allow me to add meat, and a lactoseFreePizzaBuilder, that would not allow me to add dairy product.
  void setSize(String size);
  void setCrust(String crust);
  void addTopping(String topping);
  Pizza build();
}

class ConcretePizzaBuilder implements PizzaBuilder {
  //This builder creates a pizza.
  final Pizza _pizza = Pizza();

  @override
  void setSize(String size) {
    _pizza.size = size;
  }

  @override
  void setCrust(String crust) {
    _pizza.crust = crust;
  }

  @override
  void addTopping(String topping) {
    _pizza.toppings.add(topping);
  }

  @override
  Pizza build() {
    return _pizza;
  }
}

//Director
class PizzaDirector {
  //The director define the builder "settings", so it can create the desired pizza.
  final PizzaBuilder _builder;
  PizzaDirector(this._builder);

  void constructMargheritaPizza() {
    _builder.setSize("Medium");
    _builder.setCrust("Thin");
    _builder.addTopping("Tomato");
    _builder.addTopping("Mozzarella");
  }

  void constructPepperoniPizza() {
    _builder.setSize("Large");
    _builder.setCrust("Thick");
    _builder.addTopping("Tomato");
    _builder.addTopping("Mozzarella");
    _builder.addTopping("Pepperoni");
  }
}

void main() {
  PizzaBuilder builder = ConcretePizzaBuilder(); //Here I create the builder
  PizzaDirector director = PizzaDirector(
      builder); //The director receive the builder which it will alter the "settings"

  director
      .constructMargheritaPizza(); //The director tells the builder how the pizza is supposed to be.
  Pizza margherita = builder.build();
  print(margherita);
}

//Ngl, looks to me like overengineering something simple.
//I can't even use the same builder to create more than one pizza, since it would always return the same instance of pizza(Maybe the example I got from the internet is incorrect?).