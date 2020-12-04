import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/view_models/auth_model.dart';
import 'package:lyrics_guru/busines_logic/view_models/status_model.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';

class FetchModel extends ChangeNotifier {
  final _libraryService = serviceLocator<LibraryService>();

  AuthModel _auth;
  AuthModel get auth => _auth;

  StatusModel _status;
  StatusModel get status => _status;

  void loadData(AuthModel auth, StatusModel status) async {
    _auth = auth;
    _status = status;

    _status.fetchingLibrary = true;
    await _libraryService.fetchLibrary();
    _status.fetchingLibrary = false;
    _status.libraryReady = true;
    await _auth.setLibraryFetched(true);
  }
}
