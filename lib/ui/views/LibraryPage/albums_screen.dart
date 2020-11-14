import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/view_models/library_page/albums_screen_viewmodel.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:provider/provider.dart';

import 'tracks_screen.dart';
import 'widgets/analyse_button.dart';

class AlbumsScreen extends StatefulWidget {
  final Artist artist;

  const AlbumsScreen({Key key, this.artist}) : super(key: key);

  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  AlbumsScreenViewModel model = serviceLocator<AlbumsScreenViewModel>();

  @override
  void initState() {
    model.loadData(widget.artist);
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
                  tag: this.widget.artist.thumbnailUrl,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width - 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: CachedNetworkImageProvider(
                                this.widget.artist.thumbnailUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width - 50,
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
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                              ),
                              iconSize: 30.0,
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            SizedBox(width: 20.0),
                            Text(
                              this.widget.artist.name,
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
              sliver: buildGrid(model)),
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

  Widget buildGrid(AlbumsScreenViewModel viewModel) {
    return ChangeNotifierProvider<AlbumsScreenViewModel>(
      create: (context) => viewModel,
      child: Consumer<AlbumsScreenViewModel>(
        builder: (context, model, child) => SliverGrid.count(
          crossAxisCount: 2,
          children: model.albums
              .map((a) => _AlbumPreview(
                    album: a,
                  ))
              .toList(),
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 0.77,
        ),
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
                      image: CachedNetworkImageProvider(this.album.coverUrl),
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
                  this.album.artist.name,
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
