//It is particularly useful when dealing with large numbers of objects that share common state or behavior.

//Flyweight: Define common operations for the flyweight objects.
import 'dart:collection';

abstract class Character {
  void draw(int x, int y);
}

//Concrete flyweight: The object that can be shared and reused. It contains the instrinsic state(shared state) among flyweights.
class ConcreteCharacter implements Character {
  String _font;
  ConcreteCharacter(this._font);

  @override
  void draw(int x, int y) {
    print("Drawing character with font $_font at ($x, $y)");
  }
}

//Flyweight factory: Manages and provide access to the flyweight objects. Maintains a pool of shared objects and ensured they are reused rather than creating new ones.
class CharacterFactory {
  final Map<String, Character> _characters = HashMap();

  Character getCharacter(String font) {
    if (!_characters.containsKey(font)) {
      _characters[font] = ConcreteCharacter(font);
      print("Creating new character with font $font.");
    }
    return _characters[font]!;
  }
}

void main() {
  CharacterFactory factory = CharacterFactory();

  //Creating characters
  Character char1 = factory.getCharacter("Arial");
  Character char2 = factory.getCharacter("Times New Roman");
  Character char3 = factory.getCharacter(
      "Arial"); //Since a character with the Arial font was already created, it does not need to be created again, the same instance is just returned.
  //This way, I won't waster my memory with redundant objects.

  //Drawing characters with extrinsic state
  char1.draw(10, 20);

  //If I draw a bunch of Arial characters, the font is the intrinsic state, that all the character have in common, the position in where they are drawn is not(extrinsic state).
}

//Basically, it acts so, when I need to create an object, if there is already an existing object with the characteristics I need, I get it instead of a creating a redundant one.
