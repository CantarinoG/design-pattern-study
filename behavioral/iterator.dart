//Iterator: Interface for acessing and transversing elements of an specific type of collection.
abstract class Iterator<T> {
  bool hasNext();
  T next();
}

//Aggregate: Interface for creating an Iterator object for a certain type of collection.
abstract class IterableCollection<T> {
  Iterator<T> createIterator();
}

//Concrete Iterator: Access and tranverse elements of a BookCollection.
class BookIterator implements Iterator<String> {
  final List<String> _books;
  int _current = 0;

  BookIterator(this._books);

  @override
  bool hasNext() {
    return _current < _books.length;
  }

  @override
  String next() {
    return hasNext()
        ? _books[_current++]
        : throw Exception("No more elements.");
  }
}

//Concrete Aggregate: Create an Iterator for BookCollection
class BookCollection implements IterableCollection<String> {
  final List<String> _books = [];

  void addBook(String book) {
    _books.add(book);
  }

  @override
  Iterator<String> createIterator() {
    return BookIterator(_books);
  }
}

void main() {
  BookCollection bookCollection =
      BookCollection(); //Could be any kind of collection
  bookCollection.addBook("Design Patterns"); //I add elements to it
  bookCollection.addBook("Clean Code");
  bookCollection.addBook("Refactoring");

  var iterator = bookCollection
      .createIterator(); //I create an iterator for that kind of collection

  while (iterator.hasNext()) {
    //Now, I do not interact with that collection like I'm used to, using index and such, but simple by using hasNext() and next(), abstracting the whole colletion.
    print(iterator.next());
  }
}

//With this, I could implement different traversal strategies(forward, backward, depth-first and so on) and would not have to worry at all with this in my client code.
//I would deal with any kind of collection, using any kind of traversal strategies the same way.
//The whole implementation of the collection structure or traversal strategy would be isolated.
//Took me a while to understand it's usefulness, but it is really genius.
//Java does the same thing when reading a text file. I just need to use hasNext() and next() to read a file. I have no idea what happens under the hood and I do not need to.