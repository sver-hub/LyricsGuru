import 'package:flutter/material.dart';
import 'package:flutter_app/screens/LearnPage/widgets/ArtistWordList.dart';
import 'package:flutter_app/screens/LearnPage/widgets/ChosenWords.dart';
import 'package:flutter_app/screens/LearnPage/widgets/WordCarousel.dart';

class LearnScreen extends StatefulWidget {
  final navKey;

  const LearnScreen({Key key, this.navKey}) : super(key: key);

  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
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
                return CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          WordCarousel(),
                          SizedBox(height: 20),
                          ArtistWordList(),
                          SizedBox(height: 20),
                          ChosenWords(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                );
            }
          },
        );
      },
    );
  }
}