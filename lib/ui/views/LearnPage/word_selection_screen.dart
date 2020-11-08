import 'package:flutter/material.dart';

import 'word_definition_screen.dart';
import 'quiz_screen.dart';
import 'word_learn_screen.dart';
import 'widgets/header.dart';

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
        child: SafeArea(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Header(
                  title: widget.title,
                  subtitle: widget.subtitle,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WordLearnScreen(),
                        )),
                        child: Text(
                          'Learn',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizScreen(),
                        )),
                        child: Text(
                          'Quiz',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => tiles[index],
                  childCount: tiles.length,
                ),
              )
            ],
          ),
        ));
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
    );
  }
}
