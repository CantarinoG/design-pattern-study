//Promotes loose coupling by keeping objects from referring to each other explicitly. Instead, they communicate through a mediator object.

//Mediator: Define interface for communicating with Colleague objects
abstract class Mediator {
  void notify(Object sender, String event);
}

//Colleagues: Objects that interact with each other through the mediator(no direct reference to other colleagues).
abstract class Colleague {
  final Mediator mediator;

  Colleague(this.mediator);

  void send(String event) {
    mediator.notify(this, event);
  }
}

//Concrete Colleagues
class Button extends Colleague {
  Button(Mediator mediator) : super(mediator);

  void click() {
    send("click");
  }

  void enable() {
    print("Button enabled.");
  }
}

class TextField extends Colleague {
  TextField(Mediator mediator) : super(mediator);

  void input() {
    send("input");
  }

  void clear() {
    print("Textfield cleared.");
  }
}

class Checkbox extends Colleague {
  Checkbox(Mediator mediator) : super(mediator);

  void check() {
    send("check");
    print("Checkbox is now checked.");
  }
}

//Concrete Mediator
class ConcreteMediator implements Mediator {
  Button? button;
  TextField? textField;
  Checkbox? checkbox;

  void setButton(Button button) {
    this.button = button;
  }

  void setTextField(TextField textField) {
    this.textField = textField;
  }

  void setCheckBox(Checkbox checkbox) {
    this.checkbox = checkbox;
  }

  void notify(Object sender, String event) {
    if (sender == button && event == "click") {
      print("Button clicked.");
      checkbox?.check();
    } else if (sender == textField && event == "input") {
      print("Textfield input.");
      button?.enable();
    } else if (sender == checkbox && event == "check") {
      print("Checkbox checked.");
      textField?.clear();
    }
  }
}

void main() {
  var mediator = ConcreteMediator();

  var button = Button(mediator);
  var textField = TextField(mediator);
  var checkbox = Checkbox(mediator);

  mediator.setButton(button);
  mediator.setTextField(textField);
  mediator.setCheckBox(checkbox);

  button.click();
  print("=========");
  textField.input();
  print("=========");
  checkbox.check();
}

//In this program, there are UI elements that interact with each other. The interactions are:
//When a button is clicked, the checkbox is checked.
//When the textfield receives an input, the button is enabled.
//When the checkbox is checked, the textfield is cleared.
//Instead of making the UI elements interact with each other directly, which would eventually become spaghetti code, they all interact with a mediator.
//When the mediator receives the event(such as a button being clicked), it norifies the related element to do it's thing(the checkbox being checked).
