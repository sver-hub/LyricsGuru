import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> getLyrics(String trackName, String artistName) async {
  final uri = Uri.https('api.musixmatch.com', '/ws/1.1/matcher.lyrics.get', {
    'format': 'json',
    'q_track': trackName,
    'q_artist': artistName,
    'apikey': 'c93249e90e0b1e63f6e4342b33294a3b'
  });

  final json = jsonDecode((await http.get(uri)).body);

  if (json['message'] == null ||
      json['message']['body'] == null ||
      json['message']['body']['lyrics'] == null ||
      json['message']['body']['lyrics']['lyrics_body'] == null) return null;

  return json['message']['body']['lyrics']['lyrics_body'];
}
