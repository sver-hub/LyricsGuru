import 'package:flutter/material.dart';
import 'package:flutter_app/MyGrigViewBuilder.dart';
import 'package:flutter_app/artist.dart';
import 'package:flutter_app/widgets/AlbumGrid.dart';
import 'package:flutter_app/widgets/ArtistGrid.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.blue, primaryColorDark: Colors.black),
      home: HomePage(title: 'Flutter Demo Home Page'),
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
  Artist currentArtist;

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
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              settings: settings,
              builder: (BuildContext context) {
                switch (settings.name) {
                  case '/':
                    return ArtistGrid();
                  case '/albums':
                    final artistName = settings.arguments;
                    currentArtist = artists
                        .firstWhere((element) => element.name == artistName);

                    return AlbumGrid(artist: currentArtist);
                  case '/tracks':
                    final tracks = currentArtist.albums
                        .firstWhere(
                            (element) => element.title == settings.arguments)
                        .tracks;
                    return Container(
                      child: ListView.builder(
                        itemCount: tracks.length,
                        itemBuilder: (context, index) => tracks[index],
                      ),
                    );
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
