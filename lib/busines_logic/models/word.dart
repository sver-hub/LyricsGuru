import 'track.dart';

class Word {
  final String word;
  final String definition;
  int _progress = 0;
  bool hide = false;
  List<Track> _occurances = [];

  Word(this.word, this.definition);

  List<Track> get occurances => _occurances;
  int get progress => _progress;

  void addOccurance(Track track) {
    this._occurances.add(track);
  }

  void toggleHide() {
    this.hide = !this.hide;
  }

  void addProgress(int amount) {
    this._progress += amount;
  }
}
