import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/services/word/word_service.dart';

import 'widgets/analyse_button.dart';

class LyricsScreen extends StatefulWidget {
  final Track track;

  const LyricsScreen({Key key, this.track}) : super(key: key);

  @override
  _LyricsScreenState createState() => _LyricsScreenState();
}

class _LyricsScreenState extends State<LyricsScreen> {
  WordService _wordService = serviceLocator<WordService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 80,
                  child: Text(
                    'Back to ' + widget.track.album.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
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
                'By ' + widget.track.album.artist.name,
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                ..._getLines(widget.track.lyrics).map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        e,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
                child: AnalyseButton(
                  onPressed: () {
                    _wordService.analyseLyrics(widget.track.lyrics);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<String> _getLines(String text) {
    if (text == null)
      return [
        'Either This Track Is Instrumental',
        'Or Lyrics Are Not Accessible'
      ];
    return text.split('\n');
  }
}
