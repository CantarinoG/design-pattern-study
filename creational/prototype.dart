//Prototype
abstract class Shape {
  int id;
  String type;

  Shape(this.id, this.type);

  Shape clone();
}

//Concrete prototypes
class Circle extends Shape {
  double radius;
  Circle(int id, this.radius) : super(id, "Circle");

  @override
  Circle clone() {
    return Circle(id, radius);
  }

  @override
  String toString() {
    return "Circle with ID $id and radius $radius";
  }
}

class Square extends Shape {
  double sideLenght;
  Square(int id, this.sideLenght) : super(id, "Square");
  @override
  Square clone() {
    return Square(id, sideLenght);
  }

  @override
  String toString() {
    return "Square with ID $id and side length $sideLenght";
  }
}

void main() {
  Circle originalCircle = Circle(1, 5);
  Circle clonedCircle = originalCircle.clone();
  clonedCircle.id = 2;
  print("Original ${originalCircle.toString()}");
  print("Cloned ${clonedCircle.toString()}");
}
