import 'package:flutter/material.dart';
import 'package:flutter_app/screens/LibraryPage/LyricsScreen.dart';

class Track extends StatelessWidget {
  final title;
  final artistName;
  final albumTitle;
  final lyrics;

  Track({this.title, this.artistName, this.albumTitle, this.lyrics});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LyricsScreen(
            track: this,
          ),
        ),
      ),
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
