import 'package:flutter/material.dart';

class AnalyseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        'Analyse Lyrics',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      onPressed: () => {},
    );
  }
}
