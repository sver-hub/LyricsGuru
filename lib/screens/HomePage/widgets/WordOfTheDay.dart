import 'package:flutter/material.dart';

class WordOfTheDay extends StatelessWidget {
  final word;
  final definition;

  const WordOfTheDay({Key key, this.word, this.definition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Word of the day',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            subtitle: Text('Tap here to learn more'),
          ),
          ListTile(
            title: Text(
              this.word,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                this.definition,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
