import 'package:flutter/material.dart';
import 'package:flutter_app/artist.dart';

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
                                Icons.arrow_back,
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
              children: this.artist.albums,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: 0.77,
            ),
          )
        ],
      ),
    );
  }
}
