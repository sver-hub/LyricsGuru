import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/view_models/artists_screen_viewmodel.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:provider/provider.dart';

class ArtistsScreen extends StatefulWidget {
  @override
  _ArtistsScreenState createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  ArtistsSreenViewModel model = serviceLocator<ArtistsSreenViewModel>();

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

  Widget buildGrid(ArtistsSreenViewModel viewModel) {
    return ChangeNotifierProvider<ArtistsSreenViewModel>(
      create: (context) => viewModel,
      child: Consumer<ArtistsSreenViewModel>(
        builder: (context, model, child) => SliverGrid.count(
          crossAxisCount: 2,
          children: model.artists,
          crossAxisSpacing: 30.0,
          mainAxisSpacing: 50.0,
          childAspectRatio: 0.83,
        ),
      ),
    );
  }
}
