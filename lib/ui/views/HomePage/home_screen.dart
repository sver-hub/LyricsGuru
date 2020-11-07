import 'package:flutter/material.dart';

import 'widgets/user_stats.dart';
import 'widgets/word_of_the_day.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<NavigatorState> navKey;

  const HomeScreen({Key key, this.navKey}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
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
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset(-0.5, -0.5),
                      end: FractionalOffset.bottomRight,
                      colors: [Colors.orange[900], Colors.black],
                    ),
                  ),
                  padding: EdgeInsets.only(top: 30),
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 150,
                          child: Center(
                            child: Text(
                              'Welcome Back, Sver',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            WordOfTheDay(
                              word: 'Agonizing',
                              definition:
                                  'causing great physical or mental pain.',
                            ),
                            UserStats(),
                            SizedBox(
                              height: 5000,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
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
