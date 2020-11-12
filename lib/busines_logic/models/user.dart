class User {
  static const TABLE_NAME = 'user';
  static const COLUMN_NAME = 'name';
  static const COLUMN_TOKEN = 'token';

  String token;
  String name;

  User({this.token});

  User.fromMap(Map<String, dynamic> map) {
    if (map.length > 0) {
      name = map[COLUMN_NAME];
      token = map[COLUMN_TOKEN];
    } else
      token = null;
  }

  Map<String, dynamic> toMap() {
    return {COLUMN_NAME: name, COLUMN_TOKEN: token};
  }
}
