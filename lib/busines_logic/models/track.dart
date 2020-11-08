import 'album.dart';

class Track {
  final title;
  final Album album;
  String _lyrics;

  Track({this.title, this.album});

  set lyrics(String l) => _lyrics = l;

  String get lyrics => _lyrics;
}
