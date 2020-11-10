import 'track.dart';

class Word {
  static const TABLE_NAME = 'word';
  static const COLUMN_ID = '_id';
  static const COLUMN_WORD = 'word';
  static const COLUMN_DEFINITION = 'definition';
  static const COLUMN_PROGRESS = 'progress';
  static const COLUMN_LEARNT = 'learnt';
  static const COLUMNS = [
    COLUMN_ID,
    COLUMN_WORD,
    COLUMN_DEFINITION,
    COLUMN_PROGRESS,
    COLUMN_LEARNT
  ];

  int id;
  String word;
  String definition;
  int _progress = 0;
  bool learnt = false;
  List<Track> _occurances = [];

  Word({this.word, this.definition});

  Word.fromMap(Map<String, dynamic> map) {
    id = map[COLUMN_ID];
    word = map[COLUMN_WORD];
    definition = map[COLUMN_DEFINITION];
    _progress = map[COLUMN_PROGRESS];
    learnt = map[COLUMN_LEARNT] == 1;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_WORD: word,
      COLUMN_DEFINITION: definition,
      COLUMN_PROGRESS: _progress,
      COLUMN_LEARNT: learnt ? 1 : 0
    };

    if (id != null) {
      map[COLUMN_ID] = id;
    }

    return map;
  }

  List<Track> get occurances => _occurances;
  int get progress => _progress;

  void addOccurance(Track track) {
    this._occurances.add(track);
  }

  void toggleLearn() {
    this.learnt = !this.learnt;
  }

  void addProgress(int amount) {
    this._progress += amount;
  }
}
