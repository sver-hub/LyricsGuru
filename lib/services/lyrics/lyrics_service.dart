import 'package:lyrics_guru/busines_logic/models/track.dart';

abstract class LyricsService {
  Future<String> getLyricsOfTrack(Track track);
}
