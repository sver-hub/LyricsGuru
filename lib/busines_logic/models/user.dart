class User {
  static const TABLE_NAME = 'user';
  static const COLUMN_NAME = 'name';
  static const COLUMN_IMAGE_URL = 'image_url';
  static const COLUMN_TOKEN = 'token';

  String name;
  String imageUrl;
  String token;

  User({this.token});

  User.fromMap(Map<String, dynamic> map) {
    if (map.length > 0) {
      name = map[COLUMN_NAME];
      imageUrl = map[COLUMN_IMAGE_URL];
      token = map[COLUMN_TOKEN];
    } else
      token = null;
  }

  Map<String, dynamic> toMap() {
    return {COLUMN_NAME: name, COLUMN_IMAGE_URL: imageUrl, COLUMN_TOKEN: token};
  }
}
