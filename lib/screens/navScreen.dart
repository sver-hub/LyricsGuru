import 'package:flutter/material.dart';
import 'package:flutter_app/screens/LibraryPage/libararyScreen.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  GlobalKey<NavigatorState> navKey = GlobalKey();
  List<Widget> screens;

  int _selectedIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    screens = [
      LibraryScreen(
        navKey: navKey,
      ),
      Scaffold(),
      Scaffold(),
      Scaffold(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        navKey.currentState.maybePop();
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
                navKey.currentState.popUntil((route) => route.isFirst);
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
