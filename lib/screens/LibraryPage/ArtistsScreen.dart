import 'package:flutter/material.dart';
import 'package:flutter_app/models/artist.dart';
import 'package:flutter_app/screens/LibraryPage/AlbumsScreen.dart';

class ArtistsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topLeft, //(-0.5, -0.5),
          end: FractionalOffset.bottomRight,
          stops: [0, 0.6],
          colors: [Color(0xFF33658A), Colors.black],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: Center(
                child: Text(
                  'Your Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: artists
                .map((a) => _ArtistPreview(
                      artist: a,
                    ))
                .toList(),
            crossAxisSpacing: 30.0,
            mainAxisSpacing: 50.0,
            childAspectRatio: 0.83,
          )
        ],
      ),
    );
  }
}

class _ArtistPreview extends StatelessWidget {
  final Artist artist;

  const _ArtistPreview({Key key, this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AlbumsScreen(
          artist: this.artist,
        ),
      )),
      child: SizedBox.expand(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: this.artist.thumbnailUrl,
                  child: ClipRRect(
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(this.artist.thumbnailUrl),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                this.artist.name,
                style: TextStyle(
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
