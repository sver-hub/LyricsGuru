import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';

class FoundWordsScreen extends StatelessWidget {
  final List<Word> words;

  const FoundWordsScreen({Key key, this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ...words.map((e) => ListTile(
                title: Text(e.word),
                trailing: Text(e.occurances.length.toString() + ' occurances'),
              )),
        ],
      ),
    );
  }
}
