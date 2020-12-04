import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:lyrics_guru/busines_logic/utils/artist_specific_data.dart';
import 'package:lyrics_guru/ui/navigation/route_generators/page_route_transition.dart';
import 'package:lyrics_guru/ui/views/LearnPage/artist_specific_screen.dart';
import 'package:lyrics_guru/ui/views/LearnPage/learn_screen.dart';
import 'package:lyrics_guru/ui/views/LearnPage/word_definition_screen.dart';
import 'package:lyrics_guru/ui/views/LearnPage/word_list_screen.dart';

class LearnRouteGenerator {
  static const ARTIST_SPECIFIC = '/artist_specific';
  static const WORD_LIST = '/word_list';
  static const DEFINITION = '/definition';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return PageRouteTransition.fadeTransition(to: LearnScreen());

      case ARTIST_SPECIFIC:
        if (args is List<ArtistSpecificData>)
          return PageRouteTransition.fadeTransition(
              to: ArtistSpecificScreen(data: args));
        throw Exception('Wrong params to /albums');

      case WORD_LIST:
        if (args is ArtistSpecificData)
          return PageRouteTransition.fadeTransition(
              to: WordListScreen(artistData: args));
        if (args is List<Word>)
          return PageRouteTransition.fadeTransition(
              to: WordListScreen(words: args));
        throw Exception('Wrong params to /albums');

      case DEFINITION:
        if (args is Word)
          return PageRouteTransition.fadeTransition(to: DefinitionScreen(args));
        throw Exception('Wrong params to /albums');

      default:
        throw Exception('Wrong path in home navigator');
    }
  }
}
