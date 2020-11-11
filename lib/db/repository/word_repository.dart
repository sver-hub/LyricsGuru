import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:lyrics_guru/db/database.dart';
import 'package:lyrics_guru/db/repository/repository.dart';

class WordRepository extends Repository<Word> {
  @override
  Future<List<Word>> getAll() async {
    List<Map<String, dynamic>> queryData =
        await DatabaseProvider.db.query(Word.TABLE_NAME, columns: Word.COLUMNS);
    return queryData.map((e) => Word.fromMap(e)).toList();
  }

  @override
  Future<Word> getById(int id) async {
    List<Map<String, dynamic>> queryData = await DatabaseProvider.db.query(
        Word.TABLE_NAME,
        columns: Word.COLUMNS,
        where: '${Word.COLUMN_ID} = ?',
        whereArgs: [id]);

    if (queryData.length > 1) throw Exception('Bad DB');

    return Word.fromMap(queryData[0]);
  }

  @override
  Future<bool> save(Word model) async {
    var map = model.toMap();
    int id = map[Word.COLUMN_ID];
    Word inDb = await getById(id);

    if (inDb == null) {
      int inserted = await DatabaseProvider.db.insert(Word.TABLE_NAME, map);
      if (inserted != 1) throw Exception('Failed insert');
      return true;
    }

    int updated = await DatabaseProvider.db.update(Word.TABLE_NAME, map,
        where: '${Word.COLUMN_ID} = ?', whereArgs: [id]);
    if (updated != 1) throw Exception('Failed update');
    return true;
  }
}
