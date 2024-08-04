//Product type A
abstract class Button {
  void render();
}

class LightButton implements Button {
  @override
  void render() {
    print("Rendering light button!");
  }
}

class DarkButton implements Button {
  @override
  void render() {
    print("Rendering dark button!");
  }
}

//Product type B
abstract class Checkbox {
  void render();
}

class LightCheckbox implements Checkbox {
  @override
  void render() {
    print("Rendering light checkbox!");
  }
}

class DarkCheckbox implements Checkbox {
  @override
  void render() {
    print("Rendering dark checkbox!");
  }
}

//The factory is responsible to group related objects. Instead of worrying about creating the right kind of button and the right kind of checkbox,
//I just create the right kind of factory and it create the right objects for me instead.
abstract class GUIFactory {
  Button createButton();
  Checkbox createCheckbox();
}

class LightThemeFactory implements GUIFactory {
  @override
  Button createButton() {
    return LightButton();
  }

  @override
  Checkbox createCheckbox() {
    return LightCheckbox();
  }
}

class DarkThemeFactory implements GUIFactory {
  @override
  Button createButton() {
    return DarkButton();
  }

  @override
  Checkbox createCheckbox() {
    return DarkCheckbox();
  }
}

void main() {
  GUIFactory factory = LightThemeFactory();
  Button button = factory.createButton();
  Checkbox checkbox = factory.createCheckbox();
  button.render();
  checkbox.render();

  factory = DarkThemeFactory();
  button = factory.createButton();
  checkbox = factory.createCheckbox();
  button.render();
  checkbox.render();
}
