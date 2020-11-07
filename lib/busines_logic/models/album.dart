import 'track.dart';

class Album {
  final title;
  final coverUrl;
  final artistName;
  final List<Track> tracks;

  Album({this.title, this.coverUrl, this.tracks, this.artistName});
}
