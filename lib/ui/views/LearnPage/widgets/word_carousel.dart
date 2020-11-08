import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../word_definition_screen.dart';

class WordCarousel extends StatelessWidget {
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
      items: [
        _CarouselCard(
          height: height,
          word: 'Slave',
          definition:
              '(especially in the past) a person who is the legal property of another and is forced to obey them.',
          imgUrl:
              'https://sova.ponominalu.ru/wp-content/uploads/2019/11/the-weeknd-1.jpg',
        ),
        _CarouselCard(
          height: height,
          word: 'Bleach',
          definition:
              'a chemical (typically a solution of sodium hypochlorite or hydrogen peroxide) used to make materials whiter or for sterilizing drains, sinks, etc.',
          imgUrl:
              'https://lastfm.freetls.fastly.net/i/u/ar0/ebd3f53efa7e0f5e59bf46930292154d.jpg',
        ),
      ],
    );
  }
}

class _CarouselCard extends StatelessWidget {
  final imgUrl;
  final word;
  final definition;
  final height;

  const _CarouselCard(
      {Key key, this.imgUrl, this.word, this.definition, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DefinitionScreen(
          word: word,
          definition: definition,
        ),
      )),
      child: Stack(
        children: [
          Container(
            height: height,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              //borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(this.imgUrl),
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
              this.word,
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
                this.definition,
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
