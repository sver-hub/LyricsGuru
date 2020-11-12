part of spotify;

// fuck this shit i'm out

class Me extends Endpoint {
  Me(Api api) : super(api);

  Future<Iterable<Track>> get tracks async {
    var json = await _api._get('/me/tracks');
    List<Track> tracks = [
      for (Map<String, dynamic> savedTrack in json['items'])
        Track.fromJson(savedTrack['track'])
    ];
    return tracks;
  }

  Future<Iterable<Track>> get allTracks async {
    var json = await _api._get('/me/tracks');
    final List<Paging<SavedTrack>> pages = [];
    pages.add(
        Paging<SavedTrack>.fromJson(json, (data) => SavedTrack.fromJson(data)));
    while (pages.last.next != null) {
      json = await _api._fetchSpotify(pages.last.next);
      pages.add(Paging<SavedTrack>.fromJson(
          json, (data) => SavedTrack.fromJson(data)));
    }
    final Set<String> foundArtistsIds = {};
    final Map<String, List<Image>> foundArtistsImages = {};
    for (var page in pages) {
      for (var saved in page.items) {
        for (int i = 0; i < saved.track.artists.length; ++i) {
          final artist = saved.track.artists[i];
          if (!foundArtistsIds.contains(artist.id)) {
            json = await _api._fetchSpotify(artist.href);
            final Artist fullArtist = Artist.fromJson(json);
            foundArtistsIds.add(artist.id);
            foundArtistsImages[artist.id] = fullArtist.images;
          }
          saved.track.artists[i].images = foundArtistsImages[artist.id];
        }
      }
    }
    return [
      for (Paging<SavedTrack> page in pages)
        for (SavedTrack saved in page.items) saved.track
    ];
  }
}
