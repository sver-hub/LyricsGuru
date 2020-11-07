import 'package:flutter/material.dart';
import 'widgets/artist_word_list.dart';
import 'widgets/chosen_words.dart';
import 'widgets/word_carousel.dart';

class MyWordsScreen extends StatefulWidget {
  final navKey;

  const MyWordsScreen({Key key, this.navKey}) : super(key: key);

  @override
  _MyWordsScreenState createState() => _MyWordsScreenState();
}

class _MyWordsScreenState extends State<MyWordsScreen>
    with AutomaticKeepAliveClientMixin<MyWordsScreen> {
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
                return CustomScrollView(
                  physics: BouncingScrollPhysics(),
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
