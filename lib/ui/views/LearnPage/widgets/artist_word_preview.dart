import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/utils/artist_specific_data.dart';
import 'package:lyrics_guru/ui/navigation/route_generators/learn_route_generator.dart';

class ArtistWordPreview extends StatelessWidget {
  final List<ArtistSpecificData> data;

  const ArtistWordPreview({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(LearnRouteGenerator.ARTIST_SPECIFIC, arguments: data),
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
            ...data.sublist(0, min(3, data.length)).map((e) => _ArtistWordTile(
                  artist: e.artist,
                  wordcount: e.words.length,
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
        backgroundImage: CachedNetworkImageProvider(artist.thumbnailUrl),
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
        wordcount.toString() + ' words',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
