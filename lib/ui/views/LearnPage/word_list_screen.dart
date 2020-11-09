import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:lyrics_guru/busines_logic/view_models/learn_page/word_list_screen_viewmodel.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:provider/provider.dart';

import 'word_definition_screen.dart';
import 'quiz_screen.dart';
import 'word_learn_screen.dart';
import 'widgets/header.dart';

enum Mode { artist, chosen }

class WordListScreen extends StatefulWidget {
  final Artist artist;
  final Mode _mode;
  final String _title;
  final String _subtitle;

  WordListScreen.artist({Key key, this.artist})
      : this._title = artist.name,
        this._subtitle =
            'Learn words to better understand meaning of this artist\'s songs',
        this._mode = Mode.artist,
        super(key: key);

  WordListScreen.chosen({Key key})
      : this.artist = null,
        this._title = 'Chosen by You',
        this._subtitle =
            'Learn this words to become better at understanding your favourive songs',
        this._mode = Mode.chosen,
        super(key: key);

  @override
  _WordListScreenState createState() => _WordListScreenState();
}

class _WordListScreenState extends State<WordListScreen> {
  WordListScreenViewModel model = serviceLocator<WordListScreenViewModel>();

  @override
  void initState() {
    switch (widget._mode) {
      case Mode.artist:
        model.loadDataOfArtist(widget.artist.name);
        break;
      case Mode.chosen:
        model.loadDataOfChosen();
        break;
      default:
    }
    super.initState();
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
                  title: widget._title,
                  subtitle: widget._subtitle,
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
              buildList(model),
            ],
          ),
        ));
  }

  Widget buildList(WordListScreenViewModel viewModel) {
    return ChangeNotifierProvider<WordListScreenViewModel>(
      create: (context) => viewModel,
      child: Consumer<WordListScreenViewModel>(
          builder: (context, model, child) => SliverList(
                delegate: SliverChildListDelegate(
                    model.words.map((e) => _Tile(e)).toList()),
              )),
    );
  }
}

class _Tile extends StatelessWidget {
  final Word word;

  const _Tile(this.word, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DefinitionScreen(word),
      )),
      title: Text(
        word.word,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      trailing: Text('42 uses in 27 songs'),
    );
  }
}
