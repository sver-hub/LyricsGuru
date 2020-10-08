import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/album.dart';
import 'package:flutter_app/track.dart';
import 'package:flutter_app/widgets/AlbumGrid.dart';

class Artist extends StatelessWidget {
  final name;
  final thumbnailUrl;
  final List<Album> albums;

  Artist({this.name, this.thumbnailUrl, this.albums});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AlbumGrid(
          artist: this,
        ),
      )),
      child: SizedBox.expand(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: this.thumbnailUrl,
                  child: ClipRRect(
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(this.thumbnailUrl),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                this.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
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
      artistName: 'The Weeknd',
      coverUrl:
          'https://img.discogs.com/AnoqBncXnNEWU7QdVcyBgBewE84=/fit-in/600x601/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-14970187-1586028941-7305.jpeg.jpg',
    ),
    Album(
      title: 'Beauty Behind the Madness',
      artistName: 'The Weeknd',
      coverUrl:
          'https://upload.wikimedia.org/wikipedia/ru/e/ec/Beautybehindthemadness.jpg',
    ),
    Album(
      title: 'Starboy',
      artistName: 'The Weeknd',
      coverUrl:
          'https://slm-assets.secondlife.com/assets/16223371/view_large/daft-punk-feat-the-weeknd-starboy.jpg?1485976665',
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
      artistName: 'Spiritbox',
      coverUrl:
          'https://img.discogs.com/uPmi9W3vAoCIPk4GNbXua2H8Oog=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-14702843-1579965604-3179.jpeg.jpg',
      tracks: [
        'The Mara Effect, Pt.1',
        '10:16',
        'The Mara Effect, Pt.2',
        'The Mara Effect, Pt.3',
        'Everything\'s Eventual',
        'Aphids',
        'The Beauty of Suffering'
      ]
          .map((e) => Track(
                title: e,
                artistName: 'Spiritbox',
                albumTitle: 'Spritbox',
              ))
          .toList(),
    ),
    Album(
      title: 'Singles Collection',
      artistName: 'Spiritbox',
      coverUrl: 'https://f4.bcbits.com/img/a2470668882_10.jpg',
      tracks: [
        'Perrenial',
        'Electric Cross',
        'Trust Fall',
        'Belcarra',
        'Bleach Bath'
      ]
          .map((e) => Track(
                title: e,
                artistName: 'Spiritbox',
                albumTitle: 'Singles Collection',
              ))
          .toList(),
    ),
    Album(
      title: 'Blessed Be',
      artistName: 'Spiritbox',
      coverUrl:
          'https://images-na.ssl-images-amazon.com/images/I/81gT12vQOkL._AC_UL600_SR600,600_.jpg',
      tracks: [
        Track(
          title: 'Blessed Be',
          artistName: 'Spiritbox',
          albumTitle: 'Blessed Be',
        )
      ],
    ),
    Album(
      title: 'Holly Roller',
      artistName: 'Spiritbox',
      coverUrl:
          'https://images.genius.com/f57053add2c33682f1dbb24eec841bff.1000x1000x1.jpg',
      tracks: [
        Track(
          title: 'Holly Roller',
          artistName: 'Spiritbox',
          albumTitle: 'Holly Roller',
        )
      ],
    ),
  ],
);

final Artist loathe = Artist(
  name: 'Loathe',
  thumbnailUrl: 'https://cdn.mos.cms.futurecdn.net/pXfoA59VdZsfVxwhji2hFG.jpg',
  albums: [
    Album(
      title: 'The Cold Sun',
      artistName: 'Loathe',
      coverUrl:
          'https://img.discogs.com/IDnTBE0T-7S4JRsdP6xwcMqnmkc=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-10151544-1492517616-3005.jpeg.jpg',
      tracks: [
        'The Cold Sun',
        'It\'s Yours',
        'Dance on My Skin',
        'East of Eaden',
        'Loathe',
        '3990',
        'Stigmata',
        'P.U.R.P.L.E.',
        'The Omission',
        'Nothing More',
        'Never More',
        'Babylon...'
      ]
          .map((e) => Track(
                title: e,
                artistName: 'Loathe',
                albumTitle: 'The Cold Sun',
              ))
          .toList(),
    ),
    Album(
      title: 'This Is As One',
      artistName: 'Loathe',
      coverUrl: 'https://f4.bcbits.com/img/a0686293066_10.jpg',
      tracks: ['White Hot', 'Servant And Master']
          .map((e) => Track(
                title: e,
                artistName: 'Loathe',
                albumTitle: 'This Is As One',
              ))
          .toList(),
    ),
    Album(
      title: 'I Let It In And It Took Everything',
      artistName: 'Loathe',
      coverUrl:
          'https://media.pitchfork.com/photos/5e4c12257fe1550008882dab/1:1/w_600/I%20Let%20It%20In_Loathe.jpg',
      tracks: [
        'Theme',
        'Aggressive Evolution',
        'Broken Vision Rhythm',
        'Two-Way Mirror',
        '451 Days',
        'New Faces in the Dark',
        'Red Room',
        'Screaming',
        'Is It Really You?',
        'Gored',
        'Heavy Is the Head That Falls with the Weight of a Thousand Thoughts',
        'A Sad Cartoon',
        'A Sad Cartoon (Reprise)',
        'I Let It in and It Took Everything...'
      ]
          .map((e) => Track(
                title: e,
                artistName: 'Loathe',
                albumTitle: 'I Let It in and It Took Everything',
              ))
          .toList(),
    )
  ],
);

List<Artist> artists = [weeknd, spiritbox, loathe];
