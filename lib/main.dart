import 'package:flutter/material.dart';
import 'package:flutter_app/screens/navScreen.dart';
import 'package:flutter_app/widgets/ArtistGrid.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

mixin PortraitModeMixin on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return null;
  }
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget with PortraitModeMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorDark: Colors.black,
      ),
      home: NavScreen(), //HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  GlobalKey<NavigatorState> navKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        navKey.currentState.maybePop();
        return false;
      },
      child: Scaffold(
        body: Navigator(
          key: navKey,
          observers: [HeroController()],
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              settings: settings,
              builder: (BuildContext context) {
                switch (settings.name) {
                  case '/':
                    return ArtistGrid();
                }
              },
            );
          },
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.grey[900],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.white54,
            selectedItemColor: Colors.white,
            onTap: ((int x) {
              setState(() {
                index = x;
              });
            }),
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                label: 'My Songs',
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                label: 'My Words',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
