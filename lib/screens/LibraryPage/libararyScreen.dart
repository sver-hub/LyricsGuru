import 'package:flutter/material.dart';
import 'package:flutter_app/screens/LibraryPage/ArtistsScreen.dart';

class LibraryScreen extends StatefulWidget {
  final GlobalKey<NavigatorState> navKey;

  const LibraryScreen({Key key, this.navKey}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with AutomaticKeepAliveClientMixin<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      key: widget.navKey,
      observers: [HeroController()],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return ArtistsScreen();
              default:
                return null;
            }
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
