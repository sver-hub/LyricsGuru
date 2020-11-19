import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';

import 'learn_service.dart';

class LearnServiceFake extends LearnService {
  final _libraryService = serviceLocator<LibraryService>();

  @override
  Future<List<Word>> getChosenWords() async {
    return words;
  }

  @override
  Future<List<Word>> getWordsByArtistId(String artistId) async {
    return words;
  }

  @override
  Future<List<Word>> getRandomWords(int amount) async {
    final artists = await _libraryService.getAllArtists();
    if (artists != null) {
      final albums1 = await _libraryService.getAlbumsByArtistId(artists[4].id);
      final albums2 = await _libraryService.getAlbumsByArtistId(artists[7].id);
      final track1 = await _libraryService.getTracksByAlbumId(albums1[0].id);
      final track2 = await _libraryService.getTracksByAlbumId(albums2[0].id);
      final Word slave = Word(
          word: 'Slave',
          definition:
              '(especially in the past) a person who is the legal property of another and is forced to obey them.');
      slave.addOccurance(track1[0].id);
      final Word bleach = Word(
          word: 'Bleach',
          definition:
              'a chemical (typically a solution of sodium hypochlorite or hydrogen peroxide) used to make materials whiter or for sterilizing drains, sinks, etc.');
      bleach.addOccurance(track2[0].id);
      return [slave, bleach];
    }
    return [];
  }

  @override
  Future<bool> saveWord(Word word) {
    throw UnimplementedError();
  }

  @override
  Future<List<Word>> getAllWords() {
    // TODO: implement getAllWords
    throw UnimplementedError();
  }

  @override
  Future<List<Word>> getWordsByAlbumId(String albumId) {
    // TODO: implement getWordsByAlbumId
    throw UnimplementedError();
  }
}

final List<Word> words = [
  'Spirit',
  'Bleh',
  'Mortal',
  'Extinguish',
  'Oblivion',
  'Blasphemy',
  'Remarkable',
  'Disobey',
  'Holy',
  'Phantom',
  'Explosive',
  'Gore',
  'Brood',
  'Slaughter',
]
    .map((e) => Word(
          word: e,
          definition: 'definition',
        ))
    .toList();
