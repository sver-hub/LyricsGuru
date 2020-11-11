import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';

class AlbumsScreenViewModel extends ChangeNotifier {
  final LibraryService _libraryService = serviceLocator<LibraryService>();

  List<Album> _albums = [];
  List<Album> get albums => _albums;

  Artist _artist;
  Artist get artist => _artist;

  void loadData(Artist artist) async {
    _artist = artist;
    _albums = await _libraryService.getAlbumsByArtistId(_artist.id);
    _albums.forEach((album) {
      album.artist = _artist;
    });
    notifyListeners();
  }
}
