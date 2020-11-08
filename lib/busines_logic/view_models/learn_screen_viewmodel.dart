import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:lyrics_guru/services/learn/learn_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';

class LearnScreenViewModel extends ChangeNotifier {
  final LearnService _learnService = serviceLocator<LearnService>();

  List<Widget> _carousel = [];
  List _artistWordDate = [];
  List _chosenWords = [];

  void loadData() async {
    List<Word> carouselData = await _learnService.getRandomWords(5);
    notifyListeners();
  }

  List prepareCarouselData(List<Word> words) {}
}
