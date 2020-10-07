import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/Preview.dart';
import 'package:flutter_app/album.dart';

class Artist extends StatelessWidget {
  final name;
  final thumbnailUrl;
  final List<Album> albums;

  Artist({this.name, this.thumbnailUrl, this.albums});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).pushNamed('/albums', arguments: this.name),
      child: Preview(
        imgUrl: this.thumbnailUrl,
        title: this.name,
        rounded: true,
      ),
    );
  }
}

final Artist weeknd = Artist(
  name: 'The Weeknd',
  thumbnailUrl:
      'https://sova.ponominalu.ru/wp-content/uploads/2019/11/the-weeknd-1.jpg',
  albums: [
    Album(
      title: 'After Hours',
      coverUrl:
          'https://img.discogs.com/AnoqBncXnNEWU7QdVcyBgBewE84=/fit-in/600x601/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-14970187-1586028941-7305.jpeg.jpg',
    ),
    Album(
      title: 'Beauty Behind the Madness',
      coverUrl:
          'https://upload.wikimedia.org/wikipedia/ru/e/ec/Beautybehindthemadness.jpg',
    ),
    Album(
      title: 'Starboy',
      coverUrl:
          'https://lh3.googleusercontent.com/proxy/ifosG5zhJQwUfDwWVfu-Q8rXc2ED_RMhaQQfW4axx1mrv8HetYpOeXfaCBBnUbhKxHsxEzcKykXWp3Alb_dp15vzIjEUirKnHkIONJeh5FSDl5Lut9E4U-wmjT8',
    )
  ],
);

final Artist spiritbox = Artist(
  name: 'Spiritbox',
  thumbnailUrl:
      'https://lastfm.freetls.fastly.net/i/u/ar0/ebd3f53efa7e0f5e59bf46930292154d.jpg',
  albums: [
    Album(
      title: 'Spiritbox',
      coverUrl:
          'https://img.discogs.com/uPmi9W3vAoCIPk4GNbXua2H8Oog=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-14702843-1579965604-3179.jpeg.jpg',
    ),
    Album(
      title: 'Singles Collection',
      coverUrl: 'https://f4.bcbits.com/img/a2470668882_10.jpg',
    ),
    Album(
      title: 'Holly Roller',
      coverUrl:
          'https://images.genius.com/f57053add2c33682f1dbb24eec841bff.1000x1000x1.jpg',
    ),
    Album(
      title: 'Blessed Be',
      coverUrl:
          'https://images-na.ssl-images-amazon.com/images/I/81gT12vQOkL._AC_UL600_SR600,600_.jpg',
    )
  ],
);

final Artist loathe = Artist(
  name: 'Loathe',
  thumbnailUrl: 'https://cdn.mos.cms.futurecdn.net/pXfoA59VdZsfVxwhji2hFG.jpg',
  albums: [
    Album(
      title: 'The Cold Sun',
      coverUrl:
          'https://img.discogs.com/IDnTBE0T-7S4JRsdP6xwcMqnmkc=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-10151544-1492517616-3005.jpeg.jpg',
    ),
    Album(
      title: 'I Let It In And It Took Everything',
      coverUrl:
          'https://media.pitchfork.com/photos/5e4c12257fe1550008882dab/1:1/w_600/I%20Let%20It%20In_Loathe.jpg',
    )
  ],
);

List<Artist> artists = [weeknd, spiritbox, loathe];
