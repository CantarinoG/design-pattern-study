//Component my tree can have
abstract class FileSystemComponent {
  void showDetails();
}

//Leaf: Simple objects
class File extends FileSystemComponent {
  String name;
  File(this.name);
  @override
  void showDetails() {
    print("File: $name");
  }
}

//Composite: Collection of objects
class Directory extends FileSystemComponent {
  String name;
  List<FileSystemComponent> children = [];
  Directory(this.name);

  void add(FileSystemComponent component) {
    children.add(component);
  }

  void remove(FileSystemComponent component) {
    children.remove(component);
  }

  FileSystemComponent getChild(int index) {
    return children[index];
  }

  @override
  void showDetails() {
    print("Directory: $name");
    for (var child in children) {
      child.showDetails();
    }
  }
}

void main() {
  //Leaf components:
  File file1 = File("file1.txt");
  File file2 = File("file2.txt");
  File file3 = File("file3.txt");

  //Composite components:
  Directory dir1 = Directory("dir1");
  Directory dir2 = Directory("dir2");

  //Tree structure:
  dir1.add(file1);
  dir1.add(file2);
  dir2.add(file3);
  dir2.add(dir1); //A directory in another directory

  dir2.showDetails(); //The client can treat both the same way here, since both implement the same interface.
}

//So, basically it is useful to work in a tree structure, where there is a group of objects(leaves), and some of these objects can be a sub group(composites). 
//By making both the objects and the groups implement the same interface, the client code can work with them like they were the same.