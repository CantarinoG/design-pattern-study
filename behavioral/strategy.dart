//Strategy Interface: Defines methods that each algorithm(strategy) must implement
abstract class PaymentStrategy {
  void pay(double amount);
}

//Concrete Strategies
class CreditCardPayment implements PaymentStrategy {
  @override
  void pay(double amount) {
    print("Paid $amount using credit card.");
  }
}

class PayPalPayment implements PaymentStrategy {
  @override
  void pay(double amount) {
    print("Paid $amount using PayPal.");
  }
}

class BitcoinPayment implements PaymentStrategy {
  @override
  void pay(double amount) {
    print("Paid $amount using bitcoin.");
  }
}

//Context: The object that uses the strategy.
class PaymentProcessor {
  PaymentStrategy _strategy;
  PaymentProcessor(this._strategy);

  void setStrategy(PaymentStrategy strategy) {
    _strategy = strategy;
  }

  void processPayment(double amount) {
    _strategy.pay(amount);
  }
}

void main() {
  var paymentProcessor = PaymentProcessor(CreditCardPayment());
  paymentProcessor.processPayment(100);
  paymentProcessor.setStrategy(BitcoinPayment());
  paymentProcessor.processPayment(150);
}

//For me, personally, the most intuitive of them all. I'm used to it.