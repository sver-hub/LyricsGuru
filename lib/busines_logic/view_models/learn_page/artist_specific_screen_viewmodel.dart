import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/utils/artist_specific_data.dart';

class ArtistSpecificScreenViewModel extends ChangeNotifier {
  List<ArtistSpecificData> _artistData = [];
  List<ArtistSpecificData> get artistData => _artistData;

  void loadData(List<ArtistSpecificData> data) {
    _artistData = data;
    notifyListeners();
  }
}
