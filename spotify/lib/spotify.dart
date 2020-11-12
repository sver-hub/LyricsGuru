library spotify;

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Response;
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:spotify/models/artist.dart';
import 'package:spotify/models/image.dart';

import 'models/saved_track.dart';
import 'models/paging.dart';
import 'models/track.dart';

part 'api/api.dart';
part 'api/endpoints/endpoint.dart';
part 'api/endpoints/me.dart';

class Spotify {
  static const MethodChannel _channel = const MethodChannel('spotify');

  static Future<String> getAccessToken(
      {clientId: String, redirectUrl: String, List<String> scopes}) async {
    final String token = await _channel.invokeMethod('getAccessToken',
        {'clientId': clientId, 'redirectUrl': redirectUrl, 'scopes': scopes});
    return token;
  }

  final String clientId, redirectUrl;
  final List<String> scopes;
  String _token;

  Api _api;

  Spotify({
    @required this.clientId,
    @required this.redirectUrl,
    @required this.scopes,
    String token,
  })  : _token = token,
        _api = Api(token);

  String get token => _token;

  Api get api => _api;

  Future<bool> authenticate() async {
    try {
      final token = await getAccessToken(
          clientId: clientId, redirectUrl: redirectUrl, scopes: scopes);
      _token = token;
      _api._token = _token;
      return true;
    } on PlatformException catch (e) {
      print('[SPOTIFY API]: ${e.details}');
      // _token = null;
      // rethrow;
      return false;
    }
  }
}
