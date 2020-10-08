import 'package:flutter/material.dart';
import 'package:flutter_app/track.dart';
import 'package:flutter_app/widgets/TrackList.dart';

class Album extends StatelessWidget {
  final title;
  final coverUrl;
  final artistName;
  final List<Track> tracks;

  Album({this.title, this.coverUrl, this.tracks, this.artistName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TrackList(
          album: this,
        ),
      )),
      child: SizedBox.expand(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: this.coverUrl,
                  child: ClipRRect(
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(this.coverUrl),
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
                  this.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  this.artistName,
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
