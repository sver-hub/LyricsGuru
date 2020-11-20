import 'package:flutter/material.dart';

class StatusModel extends ChangeNotifier {
  bool _fetchingLibrary = false;
  bool _libraryReady = false;

  bool get fetchingLibrary => _fetchingLibrary;
  bool get libraryReady => _libraryReady;

  set fetchingLibrary(bool val) {
    _fetchingLibrary = val;
    notifyListeners();
  }

  set libraryReady(bool val) {
    _libraryReady = val;
    notifyListeners();
  }
}
