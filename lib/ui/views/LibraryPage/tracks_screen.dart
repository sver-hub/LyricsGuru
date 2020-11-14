import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/busines_logic/view_models/library_page/tracks_screen_viewmodel.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:provider/provider.dart';

import 'lyrics_screen.dart';
import 'widgets/analyse_button.dart';

class TracksScreen extends StatefulWidget {
  final Album album;

  const TracksScreen({Key key, this.album}) : super(key: key);

  @override
  _TracksScreenState createState() => _TracksScreenState();
}

class _TracksScreenState extends State<TracksScreen> {
  TracksScreenViewModel model = serviceLocator<TracksScreenViewModel>();

  @override
  void initState() {
    model.loadData(widget.album);
    super.initState();
  }

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
                  tag: this.widget.album.coverUrl,
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: CachedNetworkImageProvider(
                                this.widget.album.coverUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: FractionalOffset(0.5, 0.7),
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.0),
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
                                this.widget.album.title,
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
            sliver: buildList(model),
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

  Widget buildList(TracksScreenViewModel viewModel) {
    return ChangeNotifierProvider<TracksScreenViewModel>(
      create: (context) => viewModel,
      child: Consumer<TracksScreenViewModel>(
        builder: (context, model, child) => SliverList(
          delegate: SliverChildListDelegate(
              model.tracks.map((t) => _TrackTile(track: t)).toList()),
        ),
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
        this.track.album.artist.name + ' - ' + this.track.album.title,
        style: TextStyle(
          color: Colors.white54,
        ),
      ),
    );
  }
}
