import 'package:flutter/material.dart';
import 'package:lyrics_guru/ui/navigation/page_navigator.dart';
import 'package:lyrics_guru/ui/navigation/route_generators/home_route_generator.dart';
import 'package:lyrics_guru/ui/navigation/route_generators/learn_route_generator.dart';
import 'package:lyrics_guru/ui/navigation/route_generators/library_route_generator.dart';

class MainNavigator extends StatefulWidget {
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator>
    with TickerProviderStateMixin<MainNavigator> {
  List<Key> _pageKeys;
  List<GlobalKey<NavigatorState>> _navKeys;
  List<AnimationController> _faders;
  Map<int, Widget> _navigators;
  int _selectedIndex = 0;
  final _routeGenerators = [
    HomeRouteGenerator.generateRoute,
    LibraryRouteGenerator.generateRoute,
    LearnRouteGenerator.generateRoute,
  ];

  @override
  void initState() {
    super.initState();
    _navKeys = [for (final _ in _routeGenerators) GlobalKey()];
    _pageKeys = [for (final _ in _routeGenerators) GlobalKey()];
    _faders = [
      for (final _ in _routeGenerators)
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
    ];
    _faders[_selectedIndex].value = 1.0;
    _navigators = {
      for (var i = 0; i < _routeGenerators.length; i++)
        i: PageNavigator(
            navKey: _navKeys[i], onGenerateRoute: _routeGenerators[i])
    };
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _navKeys[_selectedIndex].currentState.maybePop();
        return false;
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            for (final index in _navigators.keys) _buildNavigator(index)
          ],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildNavigator(int index) {
    final page = FadeTransition(
      opacity: _faders[index].drive(CurveTween(curve: Curves.fastOutSlowIn)),
      child: KeyedSubtree(key: _pageKeys[index], child: _navigators[index]),
    );

    if (index == _selectedIndex) {
      _faders[index].forward();
      return page;
    }

    _faders[index].reverse();
    if (_faders[index].isAnimating) {
      return IgnorePointer(child: page);
    }

    return Offstage(child: page);
  }

  Widget _buildBottomNavigationBar() {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        onTap: (int idx) => setState(() {
          // if (idx == _selectedIndex) {
          //   _navKeys[_selectedIndex]
          //       .currentState
          //       .popUntil(ModalRoute.withName('/'));
          //   //.pushNamedAndRemoveUntil('/', (_) => false);
          //   return;
          // }
          _selectedIndex = idx;
        }),
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Music Library',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Learn',
          ),
        ],
      ),
    );
  }
}
