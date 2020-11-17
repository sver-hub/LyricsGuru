class User {
  static const TABLE_NAME = 'user';
  static const COLUMN_NAME = 'name';
  static const COLUMN_IMAGE_URL = 'image_url';
  static const COLUMN_REFRESH_TOKEN = 'token';

  String name;
  String imageUrl;
  String refreshToken;

  User({this.refreshToken, this.name, this.imageUrl});

  User.fromMap(Map<String, dynamic> map) {
    if (map.length > 0) {
      name = map[COLUMN_NAME];
      imageUrl = map[COLUMN_IMAGE_URL];
      refreshToken = map[COLUMN_REFRESH_TOKEN];
    } else
      refreshToken = null;
  }

  Map<String, dynamic> toMap() {
    return {
      COLUMN_NAME: name,
      COLUMN_IMAGE_URL: imageUrl,
      COLUMN_REFRESH_TOKEN: refreshToken,
    };
  }
}
