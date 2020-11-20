import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/view_models/auth_model.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/ui/views/AuthPage/auth_screen.dart';
import 'package:lyrics_guru/ui/views/nav_screen.dart';
import 'package:lyrics_guru/ui/widgets/my_progress_indicator.dart';
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
    return buildScreen(model);
  }

  Widget buildScreen(AuthModel viewModel) {
    return ChangeNotifierProvider<AuthModel>(
      create: (context) => viewModel,
      child: Consumer<AuthModel>(builder: (context, model, child) {
        if (model.user == null) {
          print('loading');
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: MyProgressIndicator(),
            ),
          );
        } else if (model.user.refreshToken == null) {
          print('auth');
          return AuthScreen(model: model);
        } else {
          print('nav');
          return NavScreen();
        }
      }),
    );
  }
}
