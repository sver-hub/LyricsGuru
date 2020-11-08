import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/services/library/library_service.dart';

class LibraryServiceFake extends LibraryService {
  @override
  Future<List<Album>> getAlbumsOfArtist(String artistName) async {
    return albums
        .where((element) => element.artist.name == artistName)
        .toList();
  }

  @override
  Future<List<Artist>> getAllArtists() async {
    return artists;
  }

  @override
  Future<String> getLyricsOfTrack(String trackTitle) {
    // TODO: implement getLyricsOfTrack
    throw UnimplementedError();
  }

  @override
  Future<List<Track>> getTracksOfAlbum(String albumTitle) async {
    return tracks
        .where((element) => element.album.title == albumTitle)
        .toList();
  }
}

final List<Artist> artists = [spiritbox, loathe];
final List<Album> albums = [...spiritboxalbums, ...loathealbumls];
final List<Track> tracks = [...spititboxtracks, ...loathetracks];

final Artist spiritbox = Artist(
  name: 'Spiritbox',
  thumbnailUrl:
      'https://lastfm.freetls.fastly.net/i/u/ar0/ebd3f53efa7e0f5e59bf46930292154d.jpg',
);

final List<Album> spiritboxalbums = [
  Album(
    artist: spiritbox,
    title: 'Spiritbox',
    coverUrl:
        'https://img.discogs.com/uPmi9W3vAoCIPk4GNbXua2H8Oog=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-14702843-1579965604-3179.jpeg.jpg',
  ),
  Album(
    artist: spiritbox,
    title: 'Singles Collection',
    coverUrl: 'https://f4.bcbits.com/img/a2470668882_10.jpg',
  ),
  Album(
    artist: spiritbox,
    title: 'Blessed Be',
    coverUrl:
        'https://images-na.ssl-images-amazon.com/images/I/81gT12vQOkL._AC_UL600_SR600,600_.jpg',
  ),
  Album(
    artist: spiritbox,
    title: 'Holly Roller',
    coverUrl:
        'https://images.genius.com/f57053add2c33682f1dbb24eec841bff.1000x1000x1.jpg',
  ),
];

final List<Track> spititboxtracks = [
  ...[
    'The Mara Effect, Pt.1',
    '10:16',
    'The Mara Effect, Pt.2',
    'The Mara Effect, Pt.3',
    'Everything\'s Eventual',
    'Aphids',
    'The Beauty of Suffering'
  ].map((e) => Track(title: e, album: spiritboxalbums[0])).toList(),
  ...['Perrenial', 'Electric Cross', 'Trust Fall', 'Belcarra', 'Bleach Bath']
      .map((e) => Track(title: e, album: spiritboxalbums[1]))
      .toList(),
  Track(title: 'Blessed Be', album: spiritboxalbums[2]),
  Track(title: 'Holly Roller', album: spiritboxalbums[3]),
];

final Artist loathe = Artist(
  name: 'Loathe',
  thumbnailUrl: 'https://cdn.mos.cms.futurecdn.net/pXfoA59VdZsfVxwhji2hFG.jpg',
);

final List<Album> loathealbumls = [
  Album(
    artist: loathe,
    title: 'The Cold Sun',
    coverUrl:
        'https://img.discogs.com/IDnTBE0T-7S4JRsdP6xwcMqnmkc=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-10151544-1492517616-3005.jpeg.jpg',
  ),
  Album(
    artist: loathe,
    title: 'This Is As One',
    coverUrl: 'https://f4.bcbits.com/img/a0686293066_10.jpg',
  ),
  Album(
    artist: loathe,
    title: 'I Let It In And It Took Everything',
    coverUrl:
        'https://media.pitchfork.com/photos/5e4c12257fe1550008882dab/1:1/w_600/I%20Let%20It%20In_Loathe.jpg',
  )
];

final List<Track> loathetracks = [
  ...[
    'The Cold Sun',
    'It\'s Yours',
    'Dance on My Skin',
    'East of Eaden',
    'Loathe',
    '3990',
    'Stigmata',
    'P.U.R.P.L.E.',
    'The Omission',
    'Nothing More',
    'Never More',
    'Babylon...'
  ].map((e) => Track(title: e, album: loathealbumls[0])),
  ...['White Hot', 'Servant And Master']
      .map((e) => Track(title: e, album: loathealbumls[1])),
  ...[
    'Theme',
    'Aggressive Evolution',
    'Broken Vision Rhythm',
    'Two-Way Mirror',
    '451 Days',
    'New Faces in the Dark',
    'Red Room',
    'Screaming',
    'Is It Really You?',
    'Gored',
    'Heavy Is the Head That Falls with the Weight of a Thousand Thoughts',
    'A Sad Cartoon',
    'A Sad Cartoon (Reprise)',
    'I Let It in and It Took Everything...'
  ].map((e) => Track(title: e, album: loathealbumls[2])),
];
