import 'package:flutter/material.dart';

class Track extends StatelessWidget {
  final title;

  Track({this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.title),
    );
  }
}
