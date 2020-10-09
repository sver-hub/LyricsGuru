import 'package:flutter/material.dart';
import 'package:flutter_app/artist.dart';

class ArtistsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 150,
                child: Center(
                  child: Text(
                    'Your Music',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: artists,
            crossAxisSpacing: 30.0,
            mainAxisSpacing: 50.0,
            childAspectRatio: 0.83,
          )
        ],
      ),
    );
  }
}
