import 'package:flutter/material.dart';
import 'package:flutter_app/screens/HomePage/homeScreen.dart';
import 'package:flutter_app/screens/LearnPage/myWordsScreen.dart';
import 'package:flutter_app/screens/LibraryPage/libararyScreen.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<GlobalKey<NavigatorState>> navKeys =
      List.generate(4, (index) => GlobalKey());
  List<Widget> screens;

  int _selectedIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(
        navKey: navKeys[0],
      ),
      Scaffold(
        body: Center(
          child: Text('Search?'),
        ),
      ),
      LibraryScreen(
        navKey: navKeys[2],
      ),
      MyWordsScreen(
        navKey: navKeys[3],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        navKeys[_selectedIndex].currentState.maybePop();
        return false;
      },
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: screens,
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
              if (_selectedIndex != idx) {
                _selectedIndex = idx;
                _pageController.animateToPage(_selectedIndex,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn);
              } else {
                navKeys[_selectedIndex]
                    .currentState
                    .popUntil((route) => route.isFirst);
              }
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
