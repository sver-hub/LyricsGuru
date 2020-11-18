import 'package:flutter/material.dart';

class AnalyseButton extends StatelessWidget {
  final Function onPressed;

  const AnalyseButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        'Analyse Lyrics',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      onPressed: onPressed,
    );
  }
}
