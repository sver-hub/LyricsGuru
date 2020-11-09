import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/services/learn/learn_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';

class ArtistSpecificScreenViewModel extends ChangeNotifier {
  LearnService _learnService = serviceLocator<LearnService>();
  Map<Artist, int> _artistData = {};
  Map<Artist, int> get artistData => _artistData;

  void loadData() async {
    _artistData = await _learnService.getAllArtists();
    notifyListeners();
  }
}
