//Handler: Interface to handle the requests, typically includes a method to handle the request and a reference to the next handler in the chain.
abstract class SupportHandler {
  SupportHandler? nextHandler;

  void setNext(SupportHandler handler) {
    nextHandler = handler;
  }

  void handleRequest(String issue);
}

//Concrete Handlers
class Level1Support extends SupportHandler {
  @override
  void handleRequest(String issue) {
    if (issue == "low") {
      print("Level 1 Support: Handling low-level issue.");
    } else {
      print(
          "Level 1 Support could not handle it. Passing issue to the next handler...");
      nextHandler?.handleRequest(issue);
    }
  }
}

class Level2Support extends SupportHandler {
  @override
  void handleRequest(String issue) {
    if (issue == "medium") {
      print("Level 2 Support: Handling mid-level issue.");
    } else {
      print(
          "Level 2 Support could not handle it. Passing issue to the next handler...");
      nextHandler?.handleRequest(issue);
    }
  }
}

class Level3Support extends SupportHandler {
  @override
  void handleRequest(String issue) {
    if (issue == "high") {
      print("Level 3 Support: Handling high-level issue.");
    } else {
      print(
          "Level 3 Support could not handle it. Passing issue to the next handler...");
      nextHandler?.handleRequest(issue);
    }
  }
}

void main() {
  SupportHandler level1Support = Level1Support();
  SupportHandler level2Support = Level2Support();
  SupportHandler level3Support = Level3Support();

  level1Support.nextHandler = level2Support;
  level2Support.nextHandler = level3Support;

  level1Support.handleRequest("low");
  level1Support.handleRequest("medium");
  level1Support.handleRequest("high");
  //Pretty self-explanatory and fucking genius.
}
