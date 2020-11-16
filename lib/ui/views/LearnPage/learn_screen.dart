import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/view_models/learn_page/learn_screen_viewmodel.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/ui/views/LearnPage/widgets/artist_word_preview.dart';
import 'package:lyrics_guru/ui/views/LearnPage/widgets/chosen_words_preview.dart';
import 'package:lyrics_guru/ui/views/LearnPage/widgets/word_carousel.dart';
import 'package:provider/provider.dart';

class LearnScreen extends StatefulWidget {
  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  LearnScreenViewModel model = serviceLocator<LearnScreenViewModel>();

  @override
  void initState() {
    model.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        buildList(model),
      ],
    );
  }

  Widget buildList(LearnScreenViewModel viewModel) {
    return ChangeNotifierProvider<LearnScreenViewModel>(
      create: (context) => viewModel,
      child: Consumer<LearnScreenViewModel>(
        builder: (context, model, child) => SliverList(
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
        ),
      ),
    );
  }
}
