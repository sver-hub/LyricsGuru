import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lyrics_guru/services/service_locator.dart';

import 'ui/views/nav_screen.dart';

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

mixin PortraitModeMixin on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return null;
  }
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget with PortraitModeMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.white54,
          canvasColor: Colors.black,
          primaryColor: Colors.deepPurple,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.grey[900],
            unselectedItemColor: Colors.white54,
            selectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
              backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              minimumSize: MaterialStateProperty.all(Size(150, 50)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.deepPurple,
                  width: 10,
                ),
                borderRadius: BorderRadius.circular(40),
              )),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
              side: MaterialStateProperty.all(
                  BorderSide(color: Colors.deepPurple, width: 2)),
              minimumSize: MaterialStateProperty.all(Size(150, 50)),
              overlayColor: MaterialStateProperty.all(Colors.deepPurple),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              )),
            ),
          )),
      home: NavScreen(),
    );
  }
}
