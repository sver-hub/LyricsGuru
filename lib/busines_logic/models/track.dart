class Track {
  final title;
  final artistName;
  final albumTitle;
  String _lyrics;

  Track({this.title, this.artistName, this.albumTitle});

  set lyrics(String l) => _lyrics = l;

  String get lyrics => _lyrics;
}
