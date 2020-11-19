import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/models/album.dart';

import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/lyrics/lyrics_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';

class LyricsServiceImplementation extends LyricsService {
  final _libraryService = serviceLocator<LibraryService>();

  @override
  Future<String> getLyricsOfTrack(Track track) async {
    return await _fetchLyrics(track.title, track.album.artist.name);
  }

  Future<String> _fetchLyrics(String trackName, String artistName) async {
    final uri = Uri.https('api.musixmatch.com', '/ws/1.1/matcher.lyrics.get', {
      'format': 'json',
      'q_track': trackName,
      'q_artist': artistName,
      'apikey': 'c93249e90e0b1e63f6e4342b33294a3b'
    });

    final json = jsonDecode((await http.get(uri)).body);

    if (json['message'] == null ||
        json['message']['header'] == null ||
        json['message']['header']['status_code'] != 200 ||
        json['message']['body'] == null ||
        json['message']['body']['lyrics'] == null ||
        json['message']['body']['lyrics']['lyrics_body'] == null ||
        json['message']['body']['lyrics']['lyrics_body'] == '') return null;

    String lyrics = json['message']['body']['lyrics']['lyrics_body'];
    lyrics = lyrics.replaceRange(
        lyrics.indexOf('...\n\n*******'), lyrics.length, '');

    return lyrics;
  }

  @override
  Future<bool> fetchAndSaveLyricsOfAlbum(Album album) async {
    final tracks = await _libraryService.getTracksByAlbumId(album.id);
    tracks.forEach((track) {
      track.album = album;
    });
    for (final track in tracks) {
      if (track.lyrics == null) {
        track.lyrics = await getLyricsOfTrack(track);
        await _libraryService.saveTrack(track);
        print('saved ' + track.title);
      }
    }
    return true;
  }

  @override
  Future<bool> fetchAndSaveLyricsOfArtist(Artist artist) async {
    final albums = await _libraryService.getAlbumsByArtistId(artist.id);
    albums.forEach((album) {
      album.artist = artist;
    });
    for (final album in albums) {
      await fetchAndSaveLyricsOfAlbum(album);
    }
    return true;
  }
}
