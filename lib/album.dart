import 'package:flutter/material.dart';
import 'package:flutter_app/Preview.dart';
import 'package:flutter_app/track.dart';

class Album extends StatelessWidget {
  final title;
  final coverUrl;
  final List<Track> tracks;

  Album({this.title, this.coverUrl, this.tracks});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).pushNamed('/tracks', arguments: this.title),
      child: Preview(
        imgUrl: this.coverUrl,
        title: this.title,
        rounded: false,
      ),
    );
  }
}
