import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';
import '../word_definition_screen.dart';

class WordCarousel extends StatelessWidget {
  final Map<Word, String> data;

  const WordCarousel({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.width - 100;
    return CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 10),
          height: height,
          viewportFraction: 1,
        ),
        items: data.entries.map((e) {
          Word word = e.key;
          String imgUrl = e.value;
          return _CarouselCard(
            height: height,
            word: word,
            imgUrl: imgUrl,
          );
        }).toList());
  }
}

class _CarouselCard extends StatelessWidget {
  final imgUrl;
  final Word word;
  final height;

  const _CarouselCard({Key key, this.imgUrl, this.word, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DefinitionScreen(word),
      )),
      child: Stack(
        children: [
          Container(
            height: height,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              //borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: CachedNetworkImageProvider(this.imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.3),
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          Positioned(
            top: 50.0,
            left: 20.0,
            child: Text(
              this.word.word,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 20,
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(
                this.word.definition,
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
