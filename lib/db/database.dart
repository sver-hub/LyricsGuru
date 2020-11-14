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
      '${Album.COLUMN_RELEASE_DATE} TEXT,'
      'FOREIGN KEY (${Album.COLUMN_ARTIST_ID}) REFERENCES ${Artist.TABLE_NAME} (${Artist.COLUMN_ID}))';

  static const String _createTableTrack = 'CREATE TABLE ${Track.TABLE_NAME} ('
      '${Track.COLUMN_ID} TEXT PRIMARY KEY,'
      '${Track.COLUMN_TITLE} TEXT,'
      '${Track.COLUMN_ALBUM_ID} INTEGER,'
      '${Track.COLUMN_LYRICS} TEXT,'
      '${Track.COLUMN_TRACK_NUMBER} INTEGER,'
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
