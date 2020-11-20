class Word {
  static const TABLE_NAME = 'word';
  static const COLUMN_WORD = 'word';
  static const COLUMN_DEFINITION = 'definition';
  static const COLUMN_PROGRESS = 'progress';
  static const COLUMN_LEARNT = 'learnt';
  static const COLUMNS = [
    COLUMN_WORD,
    COLUMN_DEFINITION,
    COLUMN_PROGRESS,
    COLUMN_LEARNT
  ];

  String word;
  String definition;
  int _progress = 0;
  bool learnt;
  List<String> _occurances = [];

  Word(
      {this.word,
      this.definition,
      List<String> occurances,
      this.learnt = false})
      : _occurances = occurances ?? [];

  Word.fromMap(Map<String, dynamic> map) {
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

    return map;
  }

  List<String> get occurances => _occurances;

  int get progress => _progress;

  bool operator ==(o) => o is Word && o.word == word;
  int get hashCode => word.hashCode;

  void addOccurance(String trackId) {
    this._occurances.add(trackId);
  }

  void addAllOccurances(List<String> trackIds) {
    this._occurances.addAll(trackIds);
  }

  void addProgress(int amount) {
    this._progress += amount;
  }
}
