//Visitor Interface: Set of visit methods, one for each type of object that can be visited.
abstract class ShapeVisitor {
  void visitCircle(Circle circle);
  void visitRectangle(Rectangle rectangle);
}

//Concrete Visitor
class AreaCalculator implements ShapeVisitor {
  @override
  void visitCircle(circle) {
    double area = 3.14 * circle.radius * circle.radius;
    print("Circle area: $area.");
  }

  @override
  void visitRectangle(rectangle) {
    double area = rectangle.width * rectangle.height;
    print("Rectangle area: $area.");
  }
}

//Element Interface: Declares an accept method, which receives the visitor(which will be able to run certain behaviours)
abstract class Shape {
  void accept(ShapeVisitor visitor);
}

//Concrete Elements
class Circle implements Shape {
  double radius;
  Circle(this.radius);

  @override
  void accept(ShapeVisitor visitor) {
    visitor.visitCircle(this);
  }
}

class Rectangle implements Shape {
  double width, height;
  Rectangle(this.width, this.height);

  @override
  void accept(ShapeVisitor visitor) {
    visitor.visitRectangle(this);
  }
}

void main() {
  ShapeVisitor areaCalculator = AreaCalculator();
  Shape circle = Circle(1);
  Shape rectangle = Rectangle(1, 1);
  circle.accept(areaCalculator);
  rectangle.accept(areaCalculator);
}
