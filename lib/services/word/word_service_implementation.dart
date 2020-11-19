import 'package:lemmatizer/lemmatizer.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/services/word/word_service.dart';

class WordServiceImplementation extends WordService {
  static final wordPattern = RegExp(r"[A-Za-z']+");
  static final filterWords =
      'i he she it we you they the a an at to of and but do did have has had that then would '
              'your me my mine his her its their our us them will out can cant so this not very these those '
              'is are am shall oh what in by be for been all there what where when why how just '
              'on was or as up if with like too from no yeah hi get yes'
          .split(' ');

  final _libraryService = serviceLocator<LibraryService>();
  final _lemmatizer = Lemmatizer();

  @override
  Future<List<Word>> analyseByArtistId(String artistId) async {
    final albums = await _libraryService.getAlbumsByArtistId(artistId);
    final words = List<Word>();

    for (final album in albums) {
      final wordsOfAlbum = await analyseByAlbumId(album.id);
      for (final word in wordsOfAlbum) {
        if (!words.contains(word)) {
          words.add(word);
        } else {
          words
              .firstWhere((element) => element == word)
              .addAllOccurances(word.occurances);
        }
      }
    }

    return words..sort((a, b) => a.word.compareTo(b.word));
  }

  @override
  Future<List<Word>> analyseByAlbumId(String albumId) async {
    final tracks = await _libraryService.getTracksByAlbumId(albumId);
    final words = List<Word>();

    for (final track in tracks) {
      final wordsOfTrack = await analyseByTrackId(track.id);
      for (final word in wordsOfTrack) {
        if (!words.contains(word)) {
          words.add(word);
        } else {
          words
              .firstWhere((element) => element == word)
              .addAllOccurances(word.occurances);
        }
      }
    }

    return words..sort((a, b) => a.word.compareTo(b.word));
  }

  @override
  Future<List<Word>> analyseByTrackId(String trackId) async {
    final track = await _libraryService.getTrackById(trackId);
    if (track.lyrics != null) {
      final words = analyseLyrics(track.lyrics, track.id);
      return words;
    }
    return [];
  }

  @override
  Future<List<Word>> analyseLyrics(String lyrics, String trackId) async {
    final uniques = await _normalizeAndGetUniques(lyrics);
    final words = uniques.map((e) => Word(word: e, trackId: trackId)).toList();
    return words..sort((a, b) => a.word.compareTo(b.word));
  }

  Future<List<String>> _normalizeAndGetUniques(String lyrics) async {
    final words = Set<String>.from(
        wordPattern.allMatches(lyrics).map((e) => e.group(0).toLowerCase()));
    final filtered = Set<String>();
    for (var word in words) {
      if (WordService.CONTRACTIONS.containsKey(word)) {
        // final subs = WordService.CONTRACTIONS[word].split(' ');
        // for (var sub in subs) {
        //   sub = sub.trim();
        //   if (!filterWords.contains(sub)) filtered.add(_lemmatizer.lemma(sub));
        // }
      } else {
        word = word.replaceAll('\'', '');
        if (!filterWords.contains(word)) {
          try {
            filtered.add(_lemmatizer.lemma(word));
          } catch (e) {}
        }
      }
    }
    return filtered.toList();
  }
}
