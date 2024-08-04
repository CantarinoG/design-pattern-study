//Product is the object my creator will need to use. I can define different products, but they must have the same methods, therefore implementing the same interface
abstract class Product {
  void use();
}

class ConcreteProductA implements Product {
  @override
  void use() {
    print("Using product A!");
  }
}

class ConcreteProductB implements Product {
  @override
  void use() {
    print("Using product B!");
  }
}

//Creator is the class that will do something with the product. The thing is, it could receive different types of products. This way each concrete creator implement a concrete product.
abstract class Creator {
  Product factoryMethod();

  void doSomething() {
    Product product = factoryMethod();
    product.use();
  }
}

class ConcreteCreatorA extends Creator {
  @override
  Product factoryMethod() {
    return ConcreteProductA();
  }
}

class ConcreteCreatorB extends Creator {
  @override
  Product factoryMethod() {
    return ConcreteProductB();
  }
}

void main() {
  Creator creator = ConcreteCreatorA();
  creator.doSomething();

  creator = ConcreteCreatorB();
  creator.doSomething();
}

//Ngl, I think it would be easier and way cleaner if I just created a single creator class and passed the desired product as an argument. 
//Although, if the Creator needs to handle things different based on which kind of product it receives, it makes sense, but to me this scenario just looks like bad project design overall.