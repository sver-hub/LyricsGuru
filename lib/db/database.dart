import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/busines_logic/models/user.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  static const String _createTableArtist = 'CREATE TABLE ${Artist.TABLE_NAME} ('
      '${Artist.COLUMN_ID} TEXT PRIMARY KEY,'
      '${Artist.COLUMN_NAME} TEXT,'
      '${Artist.COLUMN_THUMBNAIL_URL} TEXT)';

  static const String _createTableAlbum = 'CREATE TABLE ${Album.TABLE_NAME} ('
      '${Album.COLUMN_ID} TEXT PRIMARY KEY,'
      '${Album.COLUMN_TITLE} TEXT,'
      '${Album.COLUMN_COVER_URL} TEXT,'
      '${Album.COLUMN_ARTIST_ID} TEXT,'
      'FOREIGN KEY (${Album.COLUMN_ARTIST_ID}) REFERENCES ${Artist.TABLE_NAME} (${Artist.COLUMN_ID}))';

  static const String _createTableTrack = 'CREATE TABLE ${Track.TABLE_NAME} ('
      '${Track.COLUMN_ID} TEXT PRIMARY KEY,'
      '${Track.COLUMN_TITLE} TEXT,'
      '${Track.COLUMN_ALBUM_ID} INTEGER,'
      '${Track.COLUMN_LYRICS} TEXT,'
      'FOREIGN KEY (${Track.COLUMN_ALBUM_ID}) REFERENCES ${Album.TABLE_NAME} (${Album.COLUMN_ID}))';

  static const String _createTableWord = 'CREATE TABLE ${Word.TABLE_NAME} ('
      '${Word.COLUMN_ID} TEXT PRIMARY KEY,'
      '${Word.COLUMN_WORD} TEXT,'
      '${Word.COLUMN_DEFINITION} TEXT,'
      '${Word.COLUMN_PROGRESS} INTEGER,'
      '${Word.COLUMN_LEARNT} INTEGER)';

  static const String _createTableWordTrack =
      'CREATE TABLE ${Word.TABLE_NAME}_${Track.TABLE_NAME} ('
      '${Word.TABLE_NAME}${Word.COLUMN_ID} TEXT,'
      '${Track.TABLE_NAME}${Track.COLUMN_ID} TEXT,'
      'PRIMARY KEY (${Word.TABLE_NAME}${Word.COLUMN_ID}, ${Track.TABLE_NAME}${Track.COLUMN_ID}))';

  static const String _createTableUser = 'CREATE TABLE ${User.TABLE_NAME} ('
      '${User.COLUMN_NAME} TEXT,'
      '${User.COLUMN_IMAGE_URL} TEXT,'
      '${User.COLUMN_TOKEN} TEXT)';

  bool deleted = true;
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    print('Getting db');

    if (!deleted) {
      print('Deleting DB');
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'LyricsGuruDB.db');
      await deleteDatabase(path);
      deleted = true;
    }

    if (_database != null) {
      return _database;
    }

    _database = await _createDatabase();

    return _database;
  }

  Future<Database> _createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(join(dbPath, 'LyricsGuruDB.db'), version: 1,
        onCreate: (Database database, int version) async {
      print('Creating db');
      await database.execute(_createTableArtist);
      await database.execute(_createTableAlbum);
      await database.execute(_createTableTrack);
      await database.execute(_createTableWord);
      await database.execute(_createTableWordTrack);
      await database.execute(_createTableUser);

      // for (Artist artist in artists) {
      //   await database.insert(Artist.TABLE_NAME, artist.toMap());
      // }

      // for (Album album in albums) {
      //   await database.insert(Album.TABLE_NAME, album.toMap());
      // }

      // for (Track track in tracks) {
      //   await database.insert(Track.TABLE_NAME, track.toMap());
      // }
    });
  }

  Future<List<Map<String, dynamic>>> query(String table,
      {bool distinct,
      List<String> columns,
      String where,
      List<dynamic> whereArgs,
      String groupBy,
      String having,
      String orderBy,
      int limit,
      int offset}) async {
    final db = await database;
    return await db.query(table,
        distinct: distinct,
        columns: columns,
        where: where,
        whereArgs: whereArgs,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        limit: limit,
        offset: offset);
  }

  Future<int> update(String table, Map<String, dynamic> values,
      {String where,
      List<dynamic> whereArgs,
      ConflictAlgorithm conflictAlgorithm}) async {
    final db = await database;
    return await db.update(table, values,
        where: where,
        whereArgs: whereArgs,
        conflictAlgorithm: conflictAlgorithm);
  }

  Future<int> insert(String table, Map<String, dynamic> values,
      {String nullColumnHack, ConflictAlgorithm conflictAlgorithm}) async {
    final db = await database;
    return await db.insert(table, values,
        nullColumnHack: nullColumnHack, conflictAlgorithm: conflictAlgorithm);
  }

  Future<List<Map<String, dynamic>>> rawQuery(String sql,
      [List<dynamic> arguments]) async {
    final db = await database;
    return await db.rawQuery(sql, arguments);
  }
}

final List<Artist> artists = [spiritbox, loathe];
final List<Album> albums = [...spiritboxalbums, ...loathealbumls];
final List<Track> tracks = [...spititboxtracks, ...loathetracks];

final Artist spiritbox = Artist(
  id: 'spititbox',
  name: 'Spiritbox',
  thumbnailUrl:
      'https://lastfm.freetls.fastly.net/i/u/ar0/ebd3f53efa7e0f5e59bf46930292154d.jpg',
);

final List<Album> spiritboxalbums = [
  Album(
    id: 'sp1',
    artist: spiritbox,
    title: 'Spiritbox',
    coverUrl:
        'https://img.discogs.com/uPmi9W3vAoCIPk4GNbXua2H8Oog=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-14702843-1579965604-3179.jpeg.jpg',
  ),
  Album(
    id: 'sp2',
    artist: spiritbox,
    title: 'Singles Collection',
    coverUrl: 'https://f4.bcbits.com/img/a2470668882_10.jpg',
  ),
  Album(
    id: 'sp3',
    artist: spiritbox,
    title: 'Blessed Be',
    coverUrl:
        'https://images-na.ssl-images-amazon.com/images/I/81gT12vQOkL._AC_UL600_SR600,600_.jpg',
  ),
  Album(
    id: 'sp4',
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
  ]
      .map((e) =>
          Track(id: e + spiritbox.name, title: e, album: spiritboxalbums[0]))
      .toList(),
  ...['Perrenial', 'Electric Cross', 'Trust Fall', 'Belcarra', 'Bleach Bath']
      .map((e) =>
          Track(id: e + spiritbox.name, title: e, album: spiritboxalbums[1]))
      .toList(),
  Track(id: 'spblessed', title: 'Blessed Be', album: spiritboxalbums[2]),
  Track(id: 'spholly', title: 'Holly Roller', album: spiritboxalbums[3]),
];

final Artist loathe = Artist(
  id: 'loathe',
  name: 'Loathe',
  thumbnailUrl: 'https://cdn.mos.cms.futurecdn.net/pXfoA59VdZsfVxwhji2hFG.jpg',
);

final List<Album> loathealbumls = [
  Album(
    id: 'l1',
    artist: loathe,
    title: 'The Cold Sun',
    coverUrl:
        'https://img.discogs.com/IDnTBE0T-7S4JRsdP6xwcMqnmkc=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-10151544-1492517616-3005.jpeg.jpg',
  ),
  Album(
    id: 'l2',
    artist: loathe,
    title: 'This Is As One',
    coverUrl: 'https://f4.bcbits.com/img/a0686293066_10.jpg',
  ),
  Album(
    id: 'l3',
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
  ].map((e) => Track(id: e + loathe.name, title: e, album: loathealbumls[0])),
  ...[
    'White Hot',
    'Servant And Master'
  ].map((e) => Track(id: e + loathe.name, title: e, album: loathealbumls[1])),
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
  ].map((e) => Track(id: e + loathe.name, title: e, album: loathealbumls[2])),
];
