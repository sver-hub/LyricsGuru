import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/view_models/learn_page/learn_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/status_model.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/ui/views/LearnPage/widgets/artist_word_preview.dart';
import 'package:lyrics_guru/ui/views/LearnPage/widgets/chosen_words_preview.dart';
import 'package:lyrics_guru/ui/views/LearnPage/widgets/word_carousel.dart';
import 'package:lyrics_guru/ui/widgets/my_progress_indicator.dart';
import 'package:provider/provider.dart';

class LearnScreen extends StatefulWidget {
  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  final model = serviceLocator<LearnScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LearnScreenViewModel>(
      create: (context) => model,
      child: Consumer<LearnScreenViewModel>(
        builder: (context, model, child) =>
            Consumer<StatusModel>(builder: (context, status, child) {
          if (!status.libraryReady) {
            model.loaded = false;
            return Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset(-0.5, -0.5),
                  end: FractionalOffset.bottomRight,
                  colors: [Colors.orange[900], Colors.black],
                ),
              ),
              child: status.fetchingLibrary
                  ? Center(
                      child: MyProgressIndicator(),
                    )
                  : null,
            );
          } else {
            if (!model.loaded) model.loadData();

            return CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      WordCarousel(data: model.carousel),
                      SizedBox(height: 20),
                      ArtistWordPreview(data: model.artistSpecific),
                      SizedBox(height: 20),
                      ChosenWordsPreview(words: model.chosenWords),
                      SizedBox(height: 20),
                    ],
                  ),
                )
              ],
            );
          }
        }),
      ),
    );
  }
}
