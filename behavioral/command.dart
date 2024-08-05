//Command interface: An interface for executing an operation.
abstract class Command {
  void execute();
  void undo();
}

//Receiver: Know how to perform the operations.
class TextEditor {
  String _text = "";

  void write(String text) {
    _text += text;
    print("Written. Text after writing: '$_text'");
  }

  void erase() {
    if (_text.isNotEmpty) {
      _text = _text.substring(0, _text.length - 1);
      print("Erased. Text after erasing: '$_text'");
    }
  }

  String get text => _text;
}

//Concrete Commands.
class WriteCommand implements Command {
  TextEditor _editor;
  String _text;

  WriteCommand(this._editor, this._text);

  @override
  void execute() {
    _editor.write(_text);
  }

  void undo() {
    for (int i = 0; i < _text.length; i++) {
      _editor.erase();
    }
  }
}

//Invoker: The one the client code will interact with. Asks the Command to carry out the request.
class TextEditorInvoker {
  final List<Command> _commandHistory = [];

  void executeCommand(Command command) {
    command.execute();
    _commandHistory.add(command);
  }

  void undo() {
    if (_commandHistory.isNotEmpty) {
      _commandHistory.removeLast().undo();
    }
  }
}

void main() {
  TextEditor editor = TextEditor();
  TextEditorInvoker invoker = TextEditorInvoker();

  Command writeHello = WriteCommand(editor, "Hello");
  Command writeBlank = WriteCommand(editor, " ");
  Command writeWorld = WriteCommand(editor, "world");

  invoker.executeCommand(writeHello);
  invoker.executeCommand(writeBlank);
  invoker.executeCommand(writeWorld);

  invoker.undo();
  invoker.undo();
  invoker.undo();
  //Pretty cool. Useful whenever I need something with an "undo" stack.
}
