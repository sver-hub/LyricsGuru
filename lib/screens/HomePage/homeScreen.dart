import 'package:flutter/material.dart';
import 'package:flutter_app/screens/HomePage/widgets/UserStats.dart';
import 'package:flutter_app/screens/HomePage/widgets/WordOfTheDay.dart';

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
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      centerTitle: true,
                      expandedHeight: 200,
                      flexibleSpace: Container(
                        color: Theme.of(context).primaryColor,
                        child: FlexibleSpaceBar(
                          title: Text('Welcome Back'),
                          background: Image(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/images/homeappbarimage.jpg'),
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
