import 'package:flutter/material.dart';
import 'package:flutter_app/album.dart';
import 'package:flutter_app/screens/LibraryPage/widgets/AnalyseButton.dart';

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
                        height: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: NetworkImage(this.album.coverUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                            begin: FractionalOffset(0.5, 0.7),
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Colors.grey.withOpacity(0.0),
                              Colors.black.withOpacity(0.4),
                            ],
                            stops: [0.0, 1.0],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        left: 10.0,
                        child: Row(
                          children: [
                            Container(
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
                                ),
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
          SliverToBoxAdapter(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 30),
                  child: AnalyseButton(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
