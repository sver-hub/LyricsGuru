import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';

import 'learn_service.dart';

class LearnServiceFake extends LearnService {
  @override
  Future<List<Word>> allWords() {
    // TODO: implement allWords
    throw UnimplementedError();
  }

  @override
  Future<List<Word>> getChosenWords() async {
    return words;
  }

  @override
  Future<List<Word>> getWordsOfAlbum(String albumTitle) {
    // TODO: implement getWordsOfAlbum
    throw UnimplementedError();
  }

  @override
  Future<List<Word>> getWordsOfArtist(String artistName) async {
    return words;
  }

  @override
  Future<List<Word>> getRandomWords(int amount) async {
    final Word slave = Word(
        word: 'Slave',
        definition:
            '(especially in the past) a person who is the legal property of another and is forced to obey them.');
    slave.addOccurance(Track(
      title: 'Servant And Master',
      album: Album(
        artist: Artist(
          name: 'Loathe',
          thumbnailUrl:
              'https://cdn.mos.cms.futurecdn.net/pXfoA59VdZsfVxwhji2hFG.jpg',
        ),
        title: 'The Cold Sun',
        coverUrl:
            'https://img.discogs.com/IDnTBE0T-7S4JRsdP6xwcMqnmkc=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-10151544-1492517616-3005.jpeg.jpg',
      ),
    ));
    final Word bleach = Word(
        word: 'Bleach',
        definition:
            'a chemical (typically a solution of sodium hypochlorite or hydrogen peroxide) used to make materials whiter or for sterilizing drains, sinks, etc.');
    bleach.addOccurance(Track(
      title: 'Bleach Bath',
      album: Album(
        artist: Artist(
          name: 'Spiritbox',
          thumbnailUrl:
              'https://lastfm.freetls.fastly.net/i/u/ar0/ebd3f53efa7e0f5e59bf46930292154d.jpg',
        ),
        title: 'Singles Collection',
        coverUrl: 'https://f4.bcbits.com/img/a2470668882_10.jpg',
      ),
    ));
    return [slave, bleach];
  }

  @override
  Future<Map<Artist, int>> getArtistsForPreview(int amount) async {
    return artistData;
  }

  @override
  Future<Map<Artist, int>> getAllArtists() async {
    return artistData;
  }

  @override
  Future<List<Word>> getSomeChosenWords(int amount) async {
    return words;
  }

  @override
  Future<bool> saveWord(Word word) {
    throw UnimplementedError();
  }
}

Artist sp = Artist(
  name: 'Silent Planet',
  thumbnailUrl:
      'https://stitchedsound.com/wp-content/uploads/2018/08/80-og-500x400.jpg',
);
Artist currents = Artist(
  name: 'Currents',
  thumbnailUrl:
      'https://img.discogs.com/-oRT5gIpgO_AsEajmYhlZHFeJnc=/600x400/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-5238860-1591372261-9394.jpeg.jpg',
);
Artist architects = Artist(
  name: 'Architects',
  thumbnailUrl:
      'https://www.upsetmagazine.com/images/article/_crop1500x1000/208-architects_jw_066.jpg',
);

final Map<Artist, int> artistData = {sp: 218, currents: 45, architects: 34};

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
