import 'package:flutter/material.dart';
import '../word_list_screen.dart';

class ChosenWords extends StatelessWidget {
  final List<String> data;

  const ChosenWords({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WordListScreen.chosen(),
      )),
      child: Container(
        decoration: BoxDecoration(
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
              child: Wrap(spacing: 15, runSpacing: 15, children: [
                ...data.map((e) => _WordWrapper(e)).toList(),
                _WordWrapper('...And More')
              ]),
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
