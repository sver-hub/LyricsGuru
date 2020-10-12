import 'package:flutter/material.dart';

class ArtistSpecificScreen extends StatefulWidget {
  @override
  _ArtistSpecificScreenState createState() => _ArtistSpecificScreenState();
}

class _ArtistSpecificScreenState extends State<ArtistSpecificScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(-0.5, -0.5),
          end: FractionalOffset.bottomRight,
          colors: [Colors.orange[900], Colors.black],
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: tiles.length,
        itemBuilder: (context, index) => index > 0
            ? tiles[index - 1]
            : Container(
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(15, 10, 20, 0),
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Artist-specific',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        'Learn words that are unique to your favourite artists, as well as most and least frequently used words',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: Colors.white54,
                      height: 3,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String artistName;
  final int wordcount;
  final String imgUrl;

  const _Tile({Key key, this.artistName, this.wordcount, this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(imgUrl),
      ),
      title: Text(
        artistName,
        style: TextStyle(
          fontSize: 22,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        wordcount.toString() + ' entries',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

List<_Tile> tiles = [
  _Tile(
    artistName: 'Silent Planet',
    wordcount: 278,
    imgUrl:
        'https://stitchedsound.com/wp-content/uploads/2018/08/80-og-500x400.jpg',
  ),
  _Tile(
    artistName: 'Currents',
    wordcount: 89,
    imgUrl:
        'https://img.discogs.com/-oRT5gIpgO_AsEajmYhlZHFeJnc=/600x400/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-5238860-1591372261-9394.jpeg.jpg',
  ),
  _Tile(
    artistName: 'Architects',
    wordcount: 35,
    imgUrl:
        'https://www.upsetmagazine.com/images/article/_crop1500x1000/208-architects_jw_066.jpg',
  ),
  _Tile(
    artistName: 'Silent Planet',
    wordcount: 278,
    imgUrl:
        'https://stitchedsound.com/wp-content/uploads/2018/08/80-og-500x400.jpg',
  ),
  _Tile(
    artistName: 'Currents',
    wordcount: 89,
    imgUrl:
        'https://img.discogs.com/-oRT5gIpgO_AsEajmYhlZHFeJnc=/600x400/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-5238860-1591372261-9394.jpeg.jpg',
  ),
  _Tile(
    artistName: 'Architects',
    wordcount: 35,
    imgUrl:
        'https://www.upsetmagazine.com/images/article/_crop1500x1000/208-architects_jw_066.jpg',
  ),
  _Tile(
    artistName: 'Silent Planet',
    wordcount: 278,
    imgUrl:
        'https://stitchedsound.com/wp-content/uploads/2018/08/80-og-500x400.jpg',
  ),
  _Tile(
    artistName: 'Currents',
    wordcount: 89,
    imgUrl:
        'https://img.discogs.com/-oRT5gIpgO_AsEajmYhlZHFeJnc=/600x400/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-5238860-1591372261-9394.jpeg.jpg',
  ),
  _Tile(
    artistName: 'Architects',
    wordcount: 35,
    imgUrl:
        'https://www.upsetmagazine.com/images/article/_crop1500x1000/208-architects_jw_066.jpg',
  ),
  _Tile(
    artistName: 'Currents',
    wordcount: 89,
    imgUrl:
        'https://img.discogs.com/-oRT5gIpgO_AsEajmYhlZHFeJnc=/600x400/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-5238860-1591372261-9394.jpeg.jpg',
  ),
  _Tile(
    artistName: 'Architects',
    wordcount: 35,
    imgUrl:
        'https://www.upsetmagazine.com/images/article/_crop1500x1000/208-architects_jw_066.jpg',
  ),
  _Tile(
    artistName: 'Silent Planet',
    wordcount: 278,
    imgUrl:
        'https://stitchedsound.com/wp-content/uploads/2018/08/80-og-500x400.jpg',
  ),
  _Tile(
    artistName: 'Currents',
    wordcount: 89,
    imgUrl:
        'https://img.discogs.com/-oRT5gIpgO_AsEajmYhlZHFeJnc=/600x400/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-5238860-1591372261-9394.jpeg.jpg',
  ),
  _Tile(
    artistName: 'Architects',
    wordcount: 35,
    imgUrl:
        'https://www.upsetmagazine.com/images/article/_crop1500x1000/208-architects_jw_066.jpg',
  ),
  _Tile(
    artistName: 'Currents',
    wordcount: 89,
    imgUrl:
        'https://img.discogs.com/-oRT5gIpgO_AsEajmYhlZHFeJnc=/600x400/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-5238860-1591372261-9394.jpeg.jpg',
  ),
  _Tile(
    artistName: 'Architects',
    wordcount: 35,
    imgUrl:
        'https://www.upsetmagazine.com/images/article/_crop1500x1000/208-architects_jw_066.jpg',
  ),
  _Tile(
    artistName: 'Silent Planet',
    wordcount: 278,
    imgUrl:
        'https://stitchedsound.com/wp-content/uploads/2018/08/80-og-500x400.jpg',
  ),
  _Tile(
    artistName: 'Currents',
    wordcount: 89,
    imgUrl:
        'https://img.discogs.com/-oRT5gIpgO_AsEajmYhlZHFeJnc=/600x400/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-5238860-1591372261-9394.jpeg.jpg',
  ),
  _Tile(
    artistName: 'Architects',
    wordcount: 35,
    imgUrl:
        'https://www.upsetmagazine.com/images/article/_crop1500x1000/208-architects_jw_066.jpg',
  ),
  _Tile(
    artistName: 'Currents',
    wordcount: 89,
    imgUrl:
        'https://img.discogs.com/-oRT5gIpgO_AsEajmYhlZHFeJnc=/600x400/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-5238860-1591372261-9394.jpeg.jpg',
  ),
];
