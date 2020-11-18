import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/lyrics/lyrics_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/services/word/word_service.dart';

class WordServiceFake extends WordService {
  static final wordPattern = RegExp(r"[A-Za-z']+");
  static final filterWords =
      'i he she it we you they the a an at to of and but do did have has had that then would '
              'your me my mine his her its their our us them will out can cant so this not very these those '
              'is are am shall oh what in by be for been all there what where when why how just '
              'on was or as up if with like too from no yeah hi get'
          .split(' ');

  final _libraryService = serviceLocator<LibraryService>();
  final _lyricsService = serviceLocator<LyricsService>();

  @override
  Future<bool> analyseByAlbumId(String albumId) async {
    final tracks = await _libraryService.getTracksByAlbumId(albumId);
    for (final track in tracks) {
      await analyseByTrackId(track.id);
    }
  }

  @override
  Future<bool> analyseByArtistId(String artistId) async {
    final albums = await _libraryService.getAlbumsByArtistId(artistId);
    for (final album in albums) {
      await analyseByAlbumId(album.id);
    }
  }

  @override
  Future<List<Word>> analyseLyrics(String lyrics) async {
    final res = await _normalizeAndGetUniques(lyrics);
    print(res);
  }

  Future<List<String>> _normalizeAndGetUniques(String lyrics) async {
    final words = Set<String>.from(
        wordPattern.allMatches(lyrics).map((e) => e.group(0).toLowerCase()));
    final filtered = Set<String>();
    for (var word in words) {
      if (WordService.CONTRACTIONS.containsKey(word)) {
        final subs = WordService.CONTRACTIONS[word].split(' ');
        for (final sub in subs) {
          if (!filterWords.contains(sub.trim())) {
            filtered.add(sub.trim());
            print(sub);
          }
        }
      } else if (!filterWords.contains(word)) {
        filtered.add(word);
      }
    }
    return filtered.toList();
  }

  @override
  Future<bool> analyseByTrackId(String trackId) async {
    final track = await _libraryService.getTrackById(trackId);
    if (track.lyrics != null) {
      await analyseLyrics(track.lyrics);
    }
  }
}
