class User {
  static const TABLE_NAME = 'user';
  static const COLUMN_NAME = 'name';
  static const COLUMN_IMAGE_URL = 'image_url';
  static const COLUMN_REFRESH_TOKEN = 'token';
  static const COLUMN_LIBRARY_FETCHED = 'library_fetched';

  String name;
  String imageUrl;
  String refreshToken;
  bool libraryFetched;

  User(
      {this.refreshToken,
      this.name,
      this.imageUrl,
      this.libraryFetched = false});

  User.fromMap(Map<String, dynamic> map) {
    if (map.length > 0) {
      name = map[COLUMN_NAME];
      imageUrl = map[COLUMN_IMAGE_URL];
      refreshToken = map[COLUMN_REFRESH_TOKEN];
      libraryFetched = map[COLUMN_LIBRARY_FETCHED] == 1;
    } else {
      refreshToken = null;
      libraryFetched = false;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      COLUMN_NAME: name,
      COLUMN_IMAGE_URL: imageUrl,
      COLUMN_REFRESH_TOKEN: refreshToken,
      COLUMN_LIBRARY_FETCHED: libraryFetched ? 1 : 0
    };
  }
}
