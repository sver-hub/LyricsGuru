import 'package:flutter/material.dart';

class Track extends StatelessWidget {
  final title;
  final artistName;
  final albumTitle;

  Track({this.title, this.artistName, this.albumTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        this.title,
        style: TextStyle(color: Colors.white, fontSize: 24),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        this.artistName + ' - ' + this.albumTitle,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
