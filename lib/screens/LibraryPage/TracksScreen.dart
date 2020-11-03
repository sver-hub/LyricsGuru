import 'package:flutter/material.dart';
import 'package:flutter_app/models/album.dart';
import 'package:flutter_app/models/track.dart';
import 'package:flutter_app/screens/LibraryPage/LyricsScreen.dart';
import 'package:flutter_app/screens/LibraryPage/widgets/AnalyseButton.dart';

class TracksScreen extends StatelessWidget {
  final Album album;

  const TracksScreen({Key key, this.album}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
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
                                  Icons.arrow_back_ios,
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
              delegate: SliverChildListDelegate(this
                  .album
                  .tracks
                  .map((t) => _TrackTile(
                        track: t,
                      ))
                  .toList()),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 50),
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

class _TrackTile extends StatelessWidget {
  final Track track;

  const _TrackTile({Key key, this.track}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LyricsScreen(
            track: this.track,
          ),
        ),
      ),
      title: Text(
        this.track.title,
        style: TextStyle(
          fontSize: 24,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        this.track.artistName + ' - ' + this.track.albumTitle,
        style: TextStyle(
          color: Colors.white54,
        ),
      ),
    );
  }
}
