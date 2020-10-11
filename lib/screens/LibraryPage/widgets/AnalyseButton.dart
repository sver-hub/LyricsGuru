import 'package:flutter/material.dart';

class AnalyseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      height: 50.0,
      child: ElevatedButton(
        child: Text(
          'Analyse Lyrics',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        )),
        onPressed: () => {},
      ),
    );
  }
}
