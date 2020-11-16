import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:lyrics_guru/busines_logic/utils/artist_specific_data.dart';
import 'package:lyrics_guru/services/learn/learn_service.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';

class LearnScreenViewModel extends ChangeNotifier {
  LearnService _learnService = serviceLocator<LearnService>();
  LibraryService _libraryService = serviceLocator<LibraryService>();

  Map<Word, String> _carousel = {};
  Map<Word, String> get carousel => _carousel;

  List<ArtistSpecificData> _artistSpecific = [];
  List<ArtistSpecificData> get artistSpecific => _artistSpecific;

  List<Word> _chosenWords = [];
  List<Word> get chosenWords => _chosenWords;

  void loadData() async {
    List<Word> carouselWords = await _learnService.getRandomWords(5);
    _carousel = prepareCarouselData(carouselWords);
    _artistSpecific = await prepareArtistSpecific();
    _chosenWords = await _learnService.getChosenWords();
    notifyListeners();
  }

  Map<Word, String> prepareCarouselData(List<Word> words) {
    final rng = Random();
    Map<Word, String> carouselData = Map();
    words.forEach((word) {
      final imgUrl = word.occurances[rng.nextInt(word.occurances.length)].album
          .artist.thumbnailUrl;
      carouselData[word] = imgUrl;
    });
    return carouselData;
  }

  Future<List<ArtistSpecificData>> prepareArtistSpecific() async {
    List<Artist> artists = await _libraryService.getAllArtists();
    List<ArtistSpecificData> result = [];
    for (var artist in artists) {
      result.add(ArtistSpecificData(
          artist: artist,
          words: await _learnService.getWordsByArtistId(artist.id)));
    }
    return result;
  }
}
