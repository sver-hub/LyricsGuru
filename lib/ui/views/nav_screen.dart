import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/view_models/status_model.dart';
import 'package:lyrics_guru/ui/views/HomePage/home_screen.dart';
import 'package:lyrics_guru/ui/views/LearnPage/learn_screen.dart';
import 'package:lyrics_guru/ui/views/LibraryPage/artists_screen.dart';
import 'package:provider/provider.dart';

List<Widget> allScreens = [HomeScreen(), ArtistsScreen(), LearnScreen()];

class PageView extends StatefulWidget {
  final GlobalKey<NavigatorState> navKey;
  final screen;

  const PageView({Key key, this.navKey, this.screen}) : super(key: key);

  @override
  _PageViewState createState() => _PageViewState();
}

class _PageViewState extends State<PageView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: widget.navKey,
        observers: [HeroController()],
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return widget.screen;
                default:
                  return null;
              }
            },
          );
        });
  }
}

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen>
    with TickerProviderStateMixin<NavScreen> {
  List<Key> _pageKeys;
  List<GlobalKey<NavigatorState>> _navKeys;
  List<AnimationController> _faders;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _navKeys =
        List<GlobalKey<NavigatorState>>.generate(3, (index) => GlobalKey());
    _pageKeys = List<Key>.generate(3, (int index) => GlobalKey()).toList();
    _faders = allScreens.map<AnimationController>((s) {
      return AnimationController(
          vsync: this, duration: Duration(milliseconds: 300));
    }).toList();
    _faders[_selectedIndex].value = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _navKeys[_selectedIndex].currentState.maybePop();
        return false;
      },
      child: Scaffold(
        body: ChangeNotifierProvider<StatusModel>(
          create: (context) => StatusModel(),
          child: Stack(
            fit: StackFit.expand,
            children: allScreens.asMap().entries.map((entry) {
              int index = entry.key;
              Widget screen = entry.value;
              final Widget view = FadeTransition(
                opacity: _faders[index]
                    .drive(CurveTween(curve: Curves.fastOutSlowIn)),
                child: KeyedSubtree(
                  key: _pageKeys[index],
                  child: PageView(
                    navKey: _navKeys[index],
                    screen: screen,
                  ),
                ),
              );
              if (index == _selectedIndex) {
                _faders[index].forward();
                return view;
              } else {
                _faders[index].reverse();
                if (_faders[index].isAnimating) {
                  return IgnorePointer(child: view);
                }
                return Offstage(child: view);
              }
            }).toList(),
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            showUnselectedLabels: true,
            onTap: (int idx) => setState(() {
              _selectedIndex = idx;
              if (idx == 2) {}
            }),
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
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

  @override
  void dispose() {
    for (AnimationController controller in _faders) controller.dispose();
    super.dispose();
  }
}
