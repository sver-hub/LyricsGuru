import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:lyrics_guru/busines_logic/view_models/library_page/found_words_screen_viewmodel.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:provider/provider.dart';

class FoundWordsScreen extends StatefulWidget {
  final List<Word> words;

  const FoundWordsScreen({Key key, this.words}) : super(key: key);

  @override
  _FoundWordsScreenState createState() => _FoundWordsScreenState();
}

class _FoundWordsScreenState extends State<FoundWordsScreen> {
  final model = serviceLocator<FoundWordsScreenViewModel>();

  @override
  void initState() {
    model.loadData(widget.words);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildList(model),
    );
  }

  Widget buildList(FoundWordsScreenViewModel viewModel) {
    return ChangeNotifierProvider<FoundWordsScreenViewModel>(
      create: (context) => viewModel,
      child: Consumer<FoundWordsScreenViewModel>(
          builder: (context, model, child) => ListView.builder(
                itemCount: model.words.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(model.words[index].word),
                  subtitle: Text('used in ' +
                      model.words[index].occurances.length.toString() +
                      ' songs'),
                  trailing: CupertinoSwitch(
                    activeColor: Theme.of(context).primaryColor,
                    value: !model.words[index].learnt,
                    onChanged: (value) {
                      model.toggleLearnt(index, value);
                    },
                  ),
                ),
              )),
    );
  }
}
