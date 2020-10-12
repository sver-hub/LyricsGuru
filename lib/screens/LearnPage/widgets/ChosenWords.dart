import 'package:flutter/material.dart';
import 'package:flutter_app/screens/LearnPage/WordSelectionScreen.dart';

class ChosenWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WordSelectionScreen(
          words: words,
          title: 'Chosen by You',
          subtitle:
              'Learn this words to become better at understanding your favourive songs',
        ),
      )),
      child: Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(20),
          color: Colors.grey[900],
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(15, 10, 20, 0),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Chosen by You',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
              subtitle: Text(
                'Learn words that you have marked as unknown or difficult',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Divider(color: Colors.white54),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                children: words.map((e) => _WordWrapper(e)).toList(),
              ),
            ),
            Divider(color: Colors.white54),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
              width: double.infinity,
              child: Text(
                'Show all',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List words = [
  'Spirit',
  'Bleh',
  'Mortal',
  'Extinguish',
  'Oblivion',
  'Blasphemy',
  'Remarkable',
  'Disobey',
  'Holy',
  'Phantom',
  'Explosive',
  'Gore',
  'Brood',
  'Slaughter',
  '...And More'
];

class _WordWrapper extends StatelessWidget {
  final String word;

  const _WordWrapper(
    this.word, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: word != '...And More' ? Colors.white24 : Colors.transparent,
      ),
      child: Text(
        word,
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}
