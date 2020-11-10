import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:lyrics_guru/busines_logic/view_models/learn_page/word_definition_screen_viewmodel.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/ui/views/LearnPage/widgets/my_tooltip.dart';
import 'package:provider/provider.dart';

class DefinitionScreen extends StatefulWidget {
  final Word word;

  const DefinitionScreen(this.word, {Key key}) : super(key: key);

  @override
  _DefinitionScreenState createState() => _DefinitionScreenState();
}

class _DefinitionScreenState extends State<DefinitionScreen> {
  WordDefinitionScreenViewModel model =
      serviceLocator<WordDefinitionScreenViewModel>();

  @override
  void initState() {
    model.loadData(widget.word);
    super.initState();
  }

  @override
  void dispose() {
    model.saveModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 20, 10),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: [
                Text(
                  widget.word.word,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildToggle(model),
                MyTooltip(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  preferBelow: false,
                  message:
                      'Words that you know\nwon\'t be included\nin your lessons',
                  textStyle: TextStyle(color: Colors.white, fontSize: 15),
                  waitDuration: Duration(seconds: 0),
                  verticalOffset: 50,
                  child: Icon(
                    Icons.help,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white70,
            thickness: 1,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                widget.word.definition ?? 'definition',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildToggle(WordDefinitionScreenViewModel viewModel) {
    return ChangeNotifierProvider<WordDefinitionScreenViewModel>(
      create: (context) => viewModel,
      child: Consumer<WordDefinitionScreenViewModel>(
        builder: (context, model, child) => Row(
          children: [
            CupertinoSwitch(
              value: model.word.learnt,
              onChanged: (bool a) => model.toggleLearnt(a),
              activeColor: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 20,
            ),
            Text(model.word.learnt
                ? 'I don\`t know this word'
                : 'I know this word'),
          ],
        ),
      ),
    );
  }
}
