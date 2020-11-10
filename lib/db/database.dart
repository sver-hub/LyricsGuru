import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
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
      await database.execute(
        'CREATE TABLE ${Artist.TABLE_NAME} ('
        '${Artist.COLUMN_ID} INTEGER PRIMARY KEY,'
        '${Artist.COLUMN_NAME} TEXT,'
        '${Artist.COLUMN_THUMBNAIL_URL} TEXT,',
      );
      await database.execute(
        'CREATE TABLE ${Album.TABLE_NAME} ('
        '${Album.COLUMN_ID} INTEGER PRIMARY KEY,'
        '${Album.COLUMN_TITLE} TEXT,'
        '${Album.COLUMN_COVER_URL} TEXT,',
      );
      await database.execute(
        'CREATE TABLE ${Track.TABLE_NAME} ('
        '${Track.COLUMN_ID} INTEGER PRIMARY KEY,'
        '${Track.COLUMN_TITLE} TEXT,'
        '${Track.COLUMN_ALBUM_ID} INTEGER,'
        '${Track.COLUMN_LYRICS} TEXT,',
      );
      await database.execute(
        'CREATE TABLE ${Word.TABLE_NAME} ('
        '${Word.COLUMN_ID} INTEGER PRIMARY KEY,'
        '${Word.COLUMN_WORD} TEXT,'
        '${Word.COLUMN_DEFINITION} TEXT,'
        '${Word.COLUMN_PROGRESS} INTEGER,'
        '${Word.COLUMN_LEARNT} INTEGER,',
      );
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
}
