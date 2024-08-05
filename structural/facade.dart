//Subsystem classes: The complex part of the software, which the user will not interact directly.
class Tv {
  void turnOn() => print("TV is turned on.");
  void turnOff() => print("TV is turned off.");
}

class DvdPlayer {
  void play() => print("DVD player is playing.");
  void stop() => print("DVD player stopped.");
}

class SoundSystem {
  void setVolume(int level) => print("Sound system volume set to $level.");
}

//Facade class: The class the user will interact, that abstracts all the subsystem.
class HomeTheaterFacade {
  final Tv _tv;
  final DvdPlayer _dvdPlayer;
  final SoundSystem _soundSystem;

  HomeTheaterFacade(this._tv, this._dvdPlayer, this._soundSystem);

  void watchMovie() {
    _tv.turnOn();
    _dvdPlayer.play();
    _soundSystem.setVolume(5);
    print("Movie is starting.");
  }

  void endMovie() {
    _tv.turnOff();
    _dvdPlayer.stop();
    _soundSystem.setVolume(0);
    print("Movie has ended.");
  }
}

void main() {
  HomeTheaterFacade homeTheater =
      HomeTheaterFacade(Tv(), DvdPlayer(), SoundSystem());

  homeTheater.watchMovie();
  homeTheater.endMovie();
  //Althoug watching a movie is a "complex" action, involving the configuration of multiple devices, the facade make it look simple for the client.
  //The client just need to call a method and do not need to worry about everything happening underneath.
}
