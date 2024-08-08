//Memento: Store the state(which cannot be overwritten) of the originator.
class Memento {
  final String _state;
  Memento(this._state);

  String get state => this.state;
}

//Originator: Object whose the state needs to be saved and restored.
class TextEditor {
  String _text = "";

  void type(String words) {
    _text += words;
  }

  String get text => _text;

  Memento save() {
    return Memento(_text);
  }

  void restore(Memento memento) {
    _text = memento._state;
  }
}

//Caretaker: Maintains the history of states.
class History {
  final List<Memento> _history = [];

  void saveState(Memento memento) {
    _history.add(memento);
  }

  Memento? undo() {
    if (_history.isNotEmpty) {
      return _history.removeLast();
    }
    return null;
  }
}

void main() {
  var editor = TextEditor();
  var history = History();

  editor.type('Hello, ');
  history.saveState(editor.save());

  editor.type('World!');
  history.saveState(editor.save());

  print('Current Text: ${editor.text}');

  editor.restore(history.undo()!);
  print('After Undo: ${editor.text}');

  editor.restore(history.undo()!);
  print('After Another Undo: ${editor.text}');
}

//Basically, if there is an object that I may need to undo in the future or keep it's history for any other purpose. I save it's state in another object(the memento).
//Then, the history(caretaker) maintains a list of all the states.
//Kind of similar to the command design pattern but for different use cases.
