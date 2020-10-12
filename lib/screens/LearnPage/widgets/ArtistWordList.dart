import 'package:flutter/material.dart';
import 'package:flutter_app/screens/LearnPage/ArtistSpecificScreen.dart';

class ArtistWordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(20),
        color: Colors.grey[900],
        // gradient: LinearGradient(
        //   colors: [Colors.grey[800], Colors.grey[900]],
        //   stops: [0, 1],
        // ),
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ArtistSpecificScreen(),
        )),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(15, 10, 20, 0),
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
            Divider(color: Colors.white54),
            _ArtistWordTile(
              artistName: 'Silent Planet',
              wordcount: 278,
              imgUrl:
                  'https://stitchedsound.com/wp-content/uploads/2018/08/80-og-500x400.jpg',
            ),
            _ArtistWordTile(
              artistName: 'Currents',
              wordcount: 89,
              imgUrl:
                  'https://img.discogs.com/-oRT5gIpgO_AsEajmYhlZHFeJnc=/600x400/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-5238860-1591372261-9394.jpeg.jpg',
            ),
            _ArtistWordTile(
              artistName: 'Architects',
              wordcount: 35,
              imgUrl:
                  'https://www.upsetmagazine.com/images/article/_crop1500x1000/208-architects_jw_066.jpg',
            ),
            Divider(color: Colors.white54),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
              width: double.infinity,
              child: Text(
                'Show all',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArtistWordTile extends StatelessWidget {
  final String artistName;
  final int wordcount;
  final String imgUrl;

  const _ArtistWordTile({Key key, this.artistName, this.wordcount, this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
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
