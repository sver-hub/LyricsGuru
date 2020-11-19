import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:lyrics_guru/busines_logic/utils/artist_specific_data.dart';
import 'package:lyrics_guru/busines_logic/utils/carousel_data.dart';
import 'package:lyrics_guru/services/learn/learn_service.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';

class LearnScreenViewModel extends ChangeNotifier {
  final _learnService = serviceLocator<LearnService>();
  final _libraryService = serviceLocator<LibraryService>();

  List<CarouselData> _carousel = [];
  List<CarouselData> get carousel => _carousel;

  List<ArtistSpecificData> _artistSpecific = [];
  List<ArtistSpecificData> get artistSpecific => _artistSpecific;

  List<Word> _chosenWords = [];
  List<Word> get chosenWords => _chosenWords;

  void loadData() async {
    //final carouselWords = await _learnService.getRandomWords(5);
    _carousel = await prepareCarouselSlides([]); //carouselWords);
    _artistSpecific = await prepareArtistSpecific();
    _chosenWords = await _learnService.getChosenWords();
    notifyListeners();
  }

  Future<List<CarouselData>> prepareCarouselSlides(List<Word> words) async {
    final rng = Random();
    final carouselDatas = List<CarouselData>();
    for (final word in words) {
      final randomTrack = await _libraryService.getCompletedTrackById(
          word.occurances[rng.nextInt(word.occurances.length)]);
      final imgUrl = randomTrack.album.artist.thumbnailUrl;
      carouselDatas.add(CarouselData(word, imgUrl));
    }
    return carouselDatas;
  }

  Future<List<ArtistSpecificData>> prepareArtistSpecific() async {
    final artists = await _libraryService.getAllArtists();
    final result = List<ArtistSpecificData>();
    for (final artist in artists) {
      result.add(ArtistSpecificData(
          artist: artist,
          words: await _learnService.getWordsByArtistId(artist.id)));
    }
    return result;
  }
}
