import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import '../artist_specific_screen.dart';

class ArtistWordList extends StatelessWidget {
  final Map<Artist, int> data;

  const ArtistWordList({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
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
            ...data.entries.map((e) => _ArtistWordTile(
                  artist: e.key,
                  wordcount: e.value,
                )),
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
  final Artist artist;
  final int wordcount;

  const _ArtistWordTile({Key key, this.artist, this.wordcount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(artist.thumbnailUrl),
      ),
      title: Text(
        artist.name,
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
