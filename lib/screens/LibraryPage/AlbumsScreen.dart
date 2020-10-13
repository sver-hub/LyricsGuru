import 'package:flutter/material.dart';
import 'package:flutter_app/models/album.dart';
import 'package:flutter_app/models/artist.dart';
import 'package:flutter_app/screens/LibraryPage/TracksScreen.dart';
import 'package:flutter_app/screens/LibraryPage/widgets/AnalyseButton.dart';

class AlbumsScreen extends StatelessWidget {
  final Artist artist;

  const AlbumsScreen({Key key, this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Hero(
                  tag: this.artist.thumbnailUrl,
                  child: Stack(
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: NetworkImage(this.artist.thumbnailUrl),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        left: 10.0,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                              ),
                              iconSize: 30.0,
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            SizedBox(width: 20.0),
                            Text(
                              this.artist.name,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              children: artist.albums
                  .map((a) => _AlbumPreview(
                        album: a,
                      ))
                  .toList(),
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: 0.77,
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
                  child: AnalyseButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AlbumPreview extends StatelessWidget {
  final Album album;

  const _AlbumPreview({Key key, this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TracksScreen(
          album: this.album,
        ),
      )),
      child: SizedBox.expand(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: this.album.coverUrl,
                  child: ClipRRect(
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(this.album.coverUrl),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  this.album.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  this.album.artistName,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 15,
                    letterSpacing: 0.8,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
