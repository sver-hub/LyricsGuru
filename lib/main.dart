import 'package:flutter/material.dart';
import 'package:flutter_app/screens/navScreen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

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
        primarySwatch: Colors.blue,
        primaryColorDark: Colors.black,
      ),
      home: NavScreen(), //HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
