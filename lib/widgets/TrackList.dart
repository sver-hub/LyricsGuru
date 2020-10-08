import 'package:flutter/material.dart';
import 'package:flutter_app/album.dart';

class TrackList extends StatelessWidget {
  final Album album;

  const TrackList({Key key, this.album}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
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
                                color: Colors.white,
                              ),
                              iconSize: 30.0,
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            this.album.title,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                backgroundColor: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
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
