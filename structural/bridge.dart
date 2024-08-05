//Implementor: The "second" component of the class, that will be passed as reference and can be extended independently.
abstract class Color {
  void applyColor();
}

//Concrete Implementor
class Red implements Color {
  @override
  void applyColor() {
    print("Applying red color.");
  }
}

class Blue implements Color {
  @override
  void applyColor() {
    print("Applying blue color.");
  }
}

//Abstraction: The interface the client code will actually interact with. Hold a reference to the implementor.
abstract class Shape {
  Color color;
  Shape(this.color);
  void draw();
}

//Refined abstraction: The "concrete" abstraction.
class Circle extends Shape {
  Circle(Color color) : super(color);

  @override
  void draw() {
    print("Drawing Circle.");
    color.applyColor();
  }
}

class Square extends Shape {
  Square(Color color) : super(color);

  @override
  void draw() {
    print("Drawing Square.");
    color.applyColor();
  }
}

void main() {
  Shape redCircle = Circle(Red());
  Shape blueSquare = Square(Blue());

  redCircle.draw();
  blueSquare.draw();
}

//I have two available colors and two available shapes, so I have four possible shape combinations. I would create an interface for shape combination and have 4 concrete implementations.
//I would be trying to extend the ShapeCombination class in two independent dimensions(shape and color).
//So, I separate one of the dimensions into a separate class hierarchy(the color).
//Now, the original classes(shapes) will reference a new object from this new hierarchy(color).
//Now, if I want to add a new color, I will simply need to create a new concrete color, and not mess with any of the shapes.
//The client will work only with the abstraction(shape).