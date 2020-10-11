import 'package:flutter/material.dart';

class ChosenWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[900],
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 20, 0),
            title: Text(
              'Chosen by You',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'Learn words that you have marked as unknown or difficult',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Divider(
            color: Colors.white54,
            thickness: 1,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            child: Wrap(
              spacing: 15,
              runSpacing: 15,
              children: [
                _WordWrapper('Spirit'),
                _WordWrapper('Bleh'),
                _WordWrapper('Mortal'),
                _WordWrapper('Extinguish'),
                _WordWrapper('Oblivion'),
                _WordWrapper('Blasphemy'),
                _WordWrapper('Remarkable'),
                _WordWrapper('Disobey'),
                _WordWrapper('Holy'),
                _WordWrapper('Phantom'),
                _WordWrapper('Explosive'),
                _WordWrapper('Gore'),
                _WordWrapper('Brood'),
                _WordWrapper('Slaughter'),
                _WordWrapper('...And More'),
              ],
            ),
          ),
          Divider(
            color: Colors.white54,
            thickness: 1,
          ),
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
