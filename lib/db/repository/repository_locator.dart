import 'package:get_it/get_it.dart';
import 'package:lyrics_guru/db/repository/album_repository.dart';
import 'package:lyrics_guru/db/repository/artist_repository.dart';
import 'package:lyrics_guru/db/repository/track_repository.dart';
import 'package:lyrics_guru/db/repository/user_repository.dart';
import 'package:lyrics_guru/db/repository/word_repository.dart';

GetIt repositoryLocator = GetIt.instance;

void setupRepositoryLocator() {
  repositoryLocator
      .registerLazySingleton<ArtistRepository>(() => ArtistRepository());
  repositoryLocator
      .registerLazySingleton<AlbumRepository>(() => AlbumRepository());
  repositoryLocator
      .registerLazySingleton<TrackRepository>(() => TrackRepository());
  repositoryLocator
      .registerLazySingleton<WordRepository>(() => WordRepository());
  repositoryLocator
      .registerLazySingleton<UserRepository>(() => UserRepository());
}
