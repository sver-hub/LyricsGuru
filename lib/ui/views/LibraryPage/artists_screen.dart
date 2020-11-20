import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/view_models/library_page/artists_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/status_model.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:provider/provider.dart';

import 'albums_screen.dart';

class ArtistsScreen extends StatefulWidget {
  @override
  _ArtistsScreenState createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  final model = serviceLocator<ArtistsScreenViewModel>();
  bool stasusSet = false;

  // @override
  // void initState() {
  //   model.loadData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
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
          SliverToBoxAdapter(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    model.fetchData();
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                IconButton(
                  icon: Icon(Icons.text_fields),
                  onPressed: () {
                    model.fetchLyrics();
                  },
                )
              ],
            ),
          ),
          buildList(model),
        ],
      ),
    );
  }

  Widget buildList(ArtistsScreenViewModel viewModel) {
    return ChangeNotifierProvider<ArtistsScreenViewModel>(
      create: (context) => viewModel,
      child: Consumer<ArtistsScreenViewModel>(
          builder: (context, model, child) => Consumer<StatusModel>(
                builder: (context, status, child) {
                  if (!stasusSet) {
                    model.setStatus(status);
                    stasusSet = true;
                  }
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        for (final artist in model.artists)
                          _ArtistPreview(artist)
                      ],
                    ),
                  );
                },
              )),
    );
  }
}

class _ArtistPreview extends StatelessWidget {
  final Artist artist;

  const _ArtistPreview(this.artist, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AlbumsScreen(
          artist: this.artist,
        ),
      )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Hero(
              tag: artist.thumbnailUrl,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: CachedNetworkImageProvider(
                  artist.thumbnailUrl,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              artist.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
