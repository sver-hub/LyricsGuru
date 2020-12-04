import 'package:lyrics_guru/busines_logic/models/word.dart';

abstract class LearnService {
  Future<List<Word>> getChosenWords();

  Future<List<Word>> getWordsByArtistId(String artistId);

  Future<List<Word>> getWordsByAlbumId(String albumId);

  Future<List<Word>> getRandomWords(int amount);

  Future<List<Word>> getAllWords();

  Future<bool> saveWord(Word word);
}
