/*Types of Proxies
Virtual Proxy: Delays the creation of the Real Subject until it is actually needed. Useful for managing resources or loading data on demand.
Protection Proxy: Controls access to the Real Subject by providing security or authorization checks. Useful for managing access rights.
Remote Proxy: Represents an object that is located on a different address space (e.g., in a different machine). Useful for distributed systems.*/

//Example of virtual proxy

//Subject: Defines common operations for both the proxy and the real object.
abstract class Image {
  void display();
}

//Real subject: The real object
class RealImage implements Image {
  String filename;
  RealImage(this.filename) {
    loadImage();
  }

  void loadImage() {
    print("Loading image $filename...");
  }

  @override
  void display() {
    print("Displaying image: $filename");
  }
}

//Proxy: The intermediary that control access to the real object/subject.
class ProxyImage implements Image {
  RealImage? realImage;
  String filename;
  ProxyImage(this.filename);

  @override
  void display() {
    if (realImage == null) {
      realImage = RealImage(filename);
    }
    realImage!.display();
  }
}

void main() {
  Image proxyImage = ProxyImage("proxyImage.png");
  Image realImage = RealImage(
      "realImage.png"); //This image is loaded right here. Even if I would not actually use it, it would load, which would be a waste of resources.

  proxyImage
      .display(); //Now the proxy image is loaded right before it is displayed.
  realImage
      .display(); //The real image that was already loaded is being displayed.
  proxyImage
      .display(); //The proxy image is being displayed again. It does not need to be loaded again since it was already loaded when the display method was first called.
}
