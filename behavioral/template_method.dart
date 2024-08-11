//Abstract Class: Contains the template method, which outlines the algorithm's structure.
abstract class DataProcessor {
  void process() {
    //The template method
    openSource();
    readData();
    processData();
    closeSource();
  }

  //Concrete Methods
  void openSource() {
    print("Opening data source...");
  }

  void closeSource() {
    print("Closing data source...");
  }

  //Methods that be implemented by subclasses
  void readData();
  void processData();
}

//Concrete Classes
class FileDataProcessor extends DataProcessor {
  @override
  void readData() {
    print("Reading data from file...");
  }

  @override
  void processData() {
    print("Processing file data...");
  }
}

class DatabaseDataProcessor extends DataProcessor {
  @override
  void readData() {
    print("Reading data from database...");
  }

  @override
  void processData() {
    print("Processing database data...");
  }
}

void main() {
  DataProcessor fileProcessor = FileDataProcessor();
  fileProcessor.process();

  DataProcessor dbProcessor = DatabaseDataProcessor();
  dbProcessor.process();
}
