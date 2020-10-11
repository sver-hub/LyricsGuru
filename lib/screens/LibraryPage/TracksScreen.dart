import 'package:flutter/material.dart';
import 'package:flutter_app/album.dart';

class TracksScreen extends StatelessWidget {
  final Album album;

  const TracksScreen({Key key, this.album}) : super(key: key);
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
                  tag: this.album.coverUrl,
                  child: Stack(
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: NetworkImage(this.album.coverUrl),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        left: 10.0,
                        child: Row(
                          children: [
                            Container(
                              color: Colors.black,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                ),
                                iconSize: 30.0,
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ),
                            SizedBox(width: 20.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 80,
                              child: Text(
                                this.album.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    backgroundColor: Colors.black),
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
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate(this.album.tracks),
            ),
          ),
        ],
      ),
    );
  }
}
