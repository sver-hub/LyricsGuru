part of spotify;

class Api {
  String _token;

  Api(String token) : _token = token {
    _me = Me(this);
  }

  static const String _baseUrl = 'https://api.spotify.com/v1';

  Future<Map<String, dynamic>> _fetchSpotify(String url) async {
    Response response =
        await http.get(url, headers: {'Authorization': 'Bearer $_token'});
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> _get(String endpoint) async {
    return _fetchSpotify('$_baseUrl$endpoint');
  }

  Me _me;
  Me get me => _me;
}
