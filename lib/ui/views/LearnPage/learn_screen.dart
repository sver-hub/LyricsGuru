import 'package:flutter/material.dart';
import 'package:lyrics_guru/ui/views/LearnPage/widgets/artist_word_list.dart';
import 'package:lyrics_guru/ui/views/LearnPage/widgets/chosen_words.dart';
import 'package:lyrics_guru/ui/views/LearnPage/widgets/word_carousel.dart';

class LearnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              WordCarousel(),
              SizedBox(height: 20),
              ArtistWordList(),
              SizedBox(height: 20),
              ChosenWords(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
