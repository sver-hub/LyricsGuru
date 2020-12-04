import 'package:flutter/material.dart';
import 'package:lyrics_guru/ui/navigation/route_generators/page_route_transition.dart';
import 'package:lyrics_guru/ui/views/HomePage/home_screen.dart';

class HomeRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return PageRouteTransition.fadeTransition(to: HomeScreen());

      default:
        throw Exception('Wrong path in home navigator');
    }
  }
}
