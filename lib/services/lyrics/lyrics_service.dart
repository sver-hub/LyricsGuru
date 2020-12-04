import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';

abstract class LyricsService {
  Future<String> getLyricsOfTrack(Track track);

  Future<bool> fetchAndSaveLyricsOfAlbum(Album album);

  Future<bool> fetchAndSaveLyricsOfArtist(Artist artist);
}
