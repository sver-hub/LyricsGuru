import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/view_models/auth_model.dart';
import 'package:lyrics_guru/busines_logic/view_models/status_model.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/ui/views/AuthPage/auth_screen.dart';
import 'package:lyrics_guru/ui/views/FetchPage/fetch_screen.dart';
import 'package:lyrics_guru/ui/navigation/main_navigator.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  AuthModel model = serviceLocator<AuthModel>();

  @override
  void initState() {
    model.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StatusModel>(
      create: (context) => StatusModel(),
      child: ChangeNotifierProvider<AuthModel>(
        create: (context) => model,
        child: Consumer<AuthModel>(
          builder: (context, auth, child) {
            if (auth.user == null) {
              print('loading');
              return Scaffold(
                backgroundColor: Colors.black,
              );
            } else if (auth.user.refreshToken == null) {
              print('auth');
              return AuthScreen(model: auth);
            } else if (!auth.user.libraryFetched) {
              print('fetch');
              return FetchScreen(
                  status: Provider.of<StatusModel>(context), auth: auth);
            } else {
              print('nav');
              return MainNavigator();
            }
          },
        ),
      ),
    );
  }
}
