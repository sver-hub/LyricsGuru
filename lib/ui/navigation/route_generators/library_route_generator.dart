import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/ui/navigation/route_generators/page_route_transition.dart';
import 'package:lyrics_guru/ui/views/LibraryPage/albums_screen.dart';
import 'package:lyrics_guru/ui/views/LibraryPage/artists_screen.dart';
import 'package:lyrics_guru/ui/views/LibraryPage/lyrics_screen.dart';
import 'package:lyrics_guru/ui/views/LibraryPage/tracks_screen.dart';

class LibraryRouteGenerator {
  static const ALBUMS = '/albums';
  static const TRACKS = '/tracks';
  static const LYRICS = '/lyrics';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return PageRouteTransition.fadeTransition(to: ArtistsScreen());

      case ALBUMS:
        if (args is Artist)
          return PageRouteTransition.fadeTransition(
              to: AlbumsScreen(artist: args));
        throw Exception('Wrong params to /albums');

      case TRACKS:
        if (args is Album)
          return PageRouteTransition.fadeTransition(
              to: TracksScreen(album: args));
        throw Exception('Wrong params to /albums');

      case LYRICS:
        if (args is Track)
          return PageRouteTransition.fadeTransition(
              to: LyricsScreen(track: args));
        throw Exception('Wrong params to /albums');

      default:
        throw Exception('Wrong path in home navigator');
    }
  }
}
