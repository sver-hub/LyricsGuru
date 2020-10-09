import 'package:flutter/material.dart';
import 'package:flutter_app/track.dart';

class LyricsScreen extends StatefulWidget {
  final Track track;

  const LyricsScreen({Key key, this.track}) : super(key: key);

  @override
  _LyricsScreenState createState() => _LyricsScreenState();
}

class _LyricsScreenState extends State<LyricsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 20, 40),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 80,
                    child: Text(
                      'Back to ' + widget.track.albumTitle,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  widget.track.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'By ' + widget.track.artistName,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.white70,
              thickness: 1,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  widget.track.lyrics ?? 'lyrics',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ));
  }
}