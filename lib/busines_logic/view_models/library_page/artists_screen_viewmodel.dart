import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';

class ArtistsScreenViewModel extends ChangeNotifier {
  final LibraryService _libraryService = serviceLocator<LibraryService>();

  List<Artist> _artists = [];
  List<Artist> get artists => _artists;

  void loadData() async {
    _artists = await _libraryService.getAllArtists();
    notifyListeners();
  }
}
