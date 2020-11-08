import 'package:lyrics_guru/busines_logic/models/word.dart';

import 'learn_service.dart';

class LearnServiceFake extends LearnService {
  @override
  Future<List<Word>> allWords() {
    // TODO: implement allWords
    throw UnimplementedError();
  }

  @override
  Future<List<Word>> getChosenWords() {
    // TODO: implement getChosenWords
    throw UnimplementedError();
  }

  @override
  Future<List<Word>> getWordsOfAlbum(String albumTitle) {
    // TODO: implement getWordsOfAlbum
    throw UnimplementedError();
  }

  @override
  Future<List<Word>> getWordsOfArtist(String artistName) {
    // TODO: implement getWordsOfArtist
    throw UnimplementedError();
  }

  @override
  Future<List<Word>> getRandomWords(int amount) {
    // TODO: implement getRandomWords
    throw UnimplementedError();
  }
}
