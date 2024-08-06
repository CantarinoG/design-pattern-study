//Abstract Expression: Interface for interpreting operations.
abstract class Expression {
  int interpret();
}

//Terminal Expression
class NumberExpression implements Expression {
  final int number;

  NumberExpression(this.number);

  @override
  int interpret() {
    return number;
  }
}

//Non-terminal Expreesion for Additions
class AddExpression implements Expression {
  final Expression leftExpression;
  final Expression rightExpression;
  AddExpression(this.leftExpression, this.rightExpression);

  @override
  int interpret() {
    return leftExpression.interpret() + rightExpression.interpret();
  }
}

//Non-terminal Expreesion for Multiplications
class MultiplyExpression implements Expression {
  final Expression leftExpression;
  final Expression rightExpression;
  MultiplyExpression(this.leftExpression, this.rightExpression);

  @override
  int interpret() {
    return leftExpression.interpret() * rightExpression.interpret();
  }
}

void main() {
  //(3 + 5) * 2
  Expression three = NumberExpression(3);
  Expression five = NumberExpression(5);
  Expression two = NumberExpression(2);

  Expression addition = AddExpression(three, five);
  Expression multiplication = MultiplyExpression(addition, two);

  int result = multiplication.interpret();
  print(result);
}
