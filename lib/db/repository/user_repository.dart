import 'package:lyrics_guru/busines_logic/models/user.dart';
import 'package:lyrics_guru/db/database.dart';
import 'package:lyrics_guru/db/repository/repository.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository extends Repository<User> {
  @override
  Future<List<User>> getAll() async {
    List<Map<String, dynamic>> queryData =
        await DatabaseProvider.db.query(User.TABLE_NAME);
    return queryData.map((e) => User.fromMap(e)).toList();
  }

  @override
  Future<User> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<bool> save(User model) async {
    var map = model.toMap();
    int count = await getCount();
    print('count:' + count.toString());
    print('map: ' + map.toString());

    if (count == 0) {
      int inserted = await DatabaseProvider.db.insert(User.TABLE_NAME, map);
      if (inserted != 1) throw Exception('Failed insert');
    } else {
      int updated = await DatabaseProvider.db.update(User.TABLE_NAME, map);
      if (updated != 1) throw Exception('Failed update');
    }
    return true;
  }

  @override
  Future<int> getCount() async {
    var x = await DatabaseProvider.db
        .rawQuery('SELECT COUNT (*) from ${User.TABLE_NAME}');
    int count = Sqflite.firstIntValue(x);
    return count;
  }
}
