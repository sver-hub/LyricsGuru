import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/view_models/library_page/artists_screen_viewmodel.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:provider/provider.dart';

import 'albums_screen.dart';

class ArtistsScreen extends StatefulWidget {
  @override
  _ArtistsScreenState createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  ArtistsScreenViewModel model = serviceLocator<ArtistsScreenViewModel>();

  @override
  void initState() {
    model.loadData();
    super.initState();
  }

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
          buildGrid(model),
        ],
      ),
    );
  }

  Widget buildGrid(ArtistsScreenViewModel viewModel) {
    return ChangeNotifierProvider<ArtistsScreenViewModel>(
      create: (context) => viewModel,
      child: Consumer<ArtistsScreenViewModel>(
        builder: (context, model, child) => SliverGrid.count(
          crossAxisCount: 2,
          children: model.artists.map((e) => _ArtistPreview(e)).toList(),
          crossAxisSpacing: 30.0,
          mainAxisSpacing: 50.0,
          childAspectRatio: 0.83,
        ),
      ),
    );
  }
}

class _ArtistPreview extends StatelessWidget {
  final Artist artist;

  const _ArtistPreview(this.artist, {Key key}) : super(key: key);

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