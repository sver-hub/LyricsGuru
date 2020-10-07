import 'package:flutter/material.dart';

class Track {
  final title;

  Track({this.title});

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(this.title),
        ],
      ),
    );
  }
}
