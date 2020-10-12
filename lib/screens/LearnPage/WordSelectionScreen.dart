import 'package:flutter/material.dart';
import 'package:flutter_app/screens/LearnPage/DefinitionScreen.dart';
import 'package:flutter_app/screens/LearnPage/widgets/Header.dart';

class WordSelectionScreen extends StatefulWidget {
  final List words;
  final title;
  final subtitle;

  const WordSelectionScreen({Key key, this.words, this.title, this.subtitle})
      : super(key: key);

  @override
  _WordSelectionScreenState createState() => _WordSelectionScreenState();
}

class _WordSelectionScreenState extends State<WordSelectionScreen> {
  List<_Tile> tiles;

  @override
  void initState() {
    super.initState();
    tiles = widget.words.map((e) => _Tile(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(-0.5, -0.5),
          end: FractionalOffset.bottomRight,
          colors: [Colors.blue[900], Colors.black],
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: tiles.length + 1,
        itemBuilder: (context, index) => index > 0
            ? tiles[index - 1]
            : Header(
                title: widget.title,
                subtitle: widget.subtitle,
              ),
      ),
    );
  }
}

class _Tile extends StatefulWidget {
  final word;

  const _Tile(this.word, {Key key}) : super(key: key);
  @override
  __TileState createState() => __TileState();
}

class __TileState extends State<_Tile> {
  bool chosen = true;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DefinitionScreen(
          word: widget.word,
        ),
      )),
      title: Text(
        widget.word,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      trailing: Text('42 uses in 27 songs'),
      // trailing: GestureDetector(
      //   onTap: () {
      //     setState(() {
      //       chosen = !chosen;
      //     });
      //   },
      // child: Container(
      //   width: 40,
      //   height: 40,
      //   decoration: BoxDecoration(
      //     shape: BoxShape.circle,
      //     color: chosen ? Colors.green : null,
      //     border: Border.all(
      //       width: 1,
      //       color: Colors.green,
      //       style: BorderStyle.solid,
      //     ),
      //   ),
      //   child: chosen ? Icon(Icons.check) : null,
      // ),
      //),
    );
  }
}
