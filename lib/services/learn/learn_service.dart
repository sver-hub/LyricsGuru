import 'package:lyrics_guru/busines_logic/models/word.dart';

abstract class LearnService {
  Future<List<Word>> getChosenWords();

  Future<List<Word>> getWordsOfArtist(String artistName);

  Future<List<Word>> getWordsOfAlbum(String albumTitle);

  Future<List<Word>> getRandomWords(int amount);

  Future<List<Word>> allWords();
}
