import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/view_models/learn_page/artist_specific_viewmodel.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:provider/provider.dart';
import 'word_selection_screen.dart';
import 'widgets/header.dart';

class ArtistSpecificScreen extends StatefulWidget {
  @override
  _ArtistSpecificScreenState createState() => _ArtistSpecificScreenState();
}

class _ArtistSpecificScreenState extends State<ArtistSpecificScreen> {
  ArtistSpecificViewModel model = serviceLocator<ArtistSpecificViewModel>();

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
          begin: FractionalOffset(-0.5, -0.5),
          end: FractionalOffset.bottomRight,
          colors: [Colors.orange[900], Colors.black],
        ),
      ),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Header(
              title: 'Artist-specific',
              subtitle:
                  'Learn words that are unique to your favourite artists, as well as most and least frequently used words',
            ),
          ),
          buildList(model),
        ],
      ),
    );
  }

  Widget buildList(ArtistSpecificViewModel viewModel) {
    return ChangeNotifierProvider<ArtistSpecificViewModel>(
      create: (context) => viewModel,
      child: Consumer<ArtistSpecificViewModel>(
        builder: (context, model, child) => SliverList(
          delegate: SliverChildListDelegate(model.artistData.entries
              .map((e) => _Tile(
                    artist: e.key,
                    wordcount: e.value,
                  ))
              .toList()),
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final Artist artist;
  final int wordcount;

  const _Tile({
    Key key,
    this.artist,
    this.wordcount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WordSelectionScreen(
          words: ['word1', 'word2'],
          title: artist.name,
          subtitle:
              'Learn words to better understand meaning of this artist\'s songs',
        ),
      )),
      contentPadding: EdgeInsets.all(10),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(artist.thumbnailUrl),
      ),
      title: Text(
        artist.name,
        style: TextStyle(
          fontSize: 22,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        wordcount.toString() + ' entries',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
