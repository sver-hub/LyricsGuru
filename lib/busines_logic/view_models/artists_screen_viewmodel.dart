import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/ui/views/LibraryPage/albums_screen.dart';

class ArtistsSreenViewModel extends ChangeNotifier {
  final LibraryService _libraryService = serviceLocator<LibraryService>();

  List<Widget> _artists = [];
  List<Widget> get artists => _artists;

  void loadData() async {
    List<Artist> artistData = await _libraryService.getAllArtists();
    _artists = artistData.map((a) => _ArtistPreview(a)).toList();
    notifyListeners();
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
