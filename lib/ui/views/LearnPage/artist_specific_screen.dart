import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/utils/artist_specific_data.dart';
import 'package:lyrics_guru/busines_logic/view_models/learn_page/artist_specific_screen_viewmodel.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/ui/navigation/route_generators/learn_route_generator.dart';
import 'package:provider/provider.dart';
import 'widgets/header.dart';

class ArtistSpecificScreen extends StatefulWidget {
  final List<ArtistSpecificData> data;

  const ArtistSpecificScreen({Key key, this.data}) : super(key: key);
  @override
  _ArtistSpecificScreenState createState() => _ArtistSpecificScreenState();
}

class _ArtistSpecificScreenState extends State<ArtistSpecificScreen> {
  ArtistSpecificScreenViewModel model =
      serviceLocator<ArtistSpecificScreenViewModel>();

  @override
  void initState() {
    model.loadData(widget.data);
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
      child: SafeArea(
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
      ),
    );
  }

  Widget buildList(ArtistSpecificScreenViewModel viewModel) {
    return ChangeNotifierProvider<ArtistSpecificScreenViewModel>(
      create: (context) => viewModel,
      child: Consumer<ArtistSpecificScreenViewModel>(
        builder: (context, model, child) => SliverList(
          delegate: SliverChildListDelegate(model.artistData
              .map((e) => _Tile(
                    artistData: e,
                  ))
              .toList()),
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final ArtistSpecificData artistData;

  const _Tile({
    Key key,
    this.artistData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context)
          .pushNamed(LearnRouteGenerator.WORD_LIST, arguments: artistData),
      contentPadding: EdgeInsets.all(10),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage:
            CachedNetworkImageProvider(artistData.artist.thumbnailUrl),
      ),
      title: Text(
        artistData.artist.name,
        style: TextStyle(
          fontSize: 22,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        artistData.words.length.toString() + ' words',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
