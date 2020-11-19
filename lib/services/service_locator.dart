import 'package:get_it/get_it.dart';
import 'package:lyrics_guru/busines_logic/view_models/auth_model.dart';
import 'package:lyrics_guru/busines_logic/view_models/learn_page/artist_specific_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/learn_page/learn_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/learn_page/word_definition_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/learn_page/word_list_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/library_page/albums_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/library_page/artists_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/library_page/found_words_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/library_page/lyrics_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/library_page/tracks_screen_viewmodel.dart';
import 'package:lyrics_guru/services/auth/auth_service.dart';
import 'package:lyrics_guru/services/auth/auth_service_implementation.dart';
import 'package:lyrics_guru/services/learn/learn_service.dart';
import 'package:lyrics_guru/services/learn/learn_service_fake.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/library/library_service_implementation.dart';
import 'package:lyrics_guru/services/lyrics/lyrics_service.dart';
import 'package:lyrics_guru/services/lyrics/lyrics_service_implementation.dart';
import 'package:lyrics_guru/services/spotify/spotify_service.dart';
import 'package:lyrics_guru/services/spotify/spotify_service_implementation.dart';
import 'package:lyrics_guru/services/word/word_service.dart';
import 'package:lyrics_guru/services/word/word_service_implementation.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<LibraryService>(
      () => LibraryServiceImplementation());
  serviceLocator.registerLazySingleton<LearnService>(() => LearnServiceFake());
  serviceLocator
      .registerLazySingleton<AuthService>(() => AuthServiceImplementation());
  serviceLocator.registerLazySingleton<SpotifyService>(
      () => SpotifyServiceImplementation());
  serviceLocator.registerLazySingleton<LyricsService>(
      () => LyricsServiceImplementation());
  serviceLocator
      .registerLazySingleton<WordService>(() => WordServiceImplementation());

  serviceLocator
      .registerFactory<ArtistsScreenViewModel>(() => ArtistsScreenViewModel());
  serviceLocator
      .registerFactory<AlbumsScreenViewModel>(() => AlbumsScreenViewModel());
  serviceLocator
      .registerFactory<TracksScreenViewModel>(() => TracksScreenViewModel());

  serviceLocator
      .registerFactory<LearnScreenViewModel>(() => LearnScreenViewModel());
  serviceLocator.registerFactory<ArtistSpecificScreenViewModel>(
      () => ArtistSpecificScreenViewModel());
  serviceLocator.registerFactory<WordListScreenViewModel>(
      () => WordListScreenViewModel());
  serviceLocator.registerFactory<WordDefinitionScreenViewModel>(
      () => WordDefinitionScreenViewModel());
  serviceLocator.registerFactory<AuthModel>(() => AuthModel());
  serviceLocator
      .registerFactory<LyricsScreenViewModel>(() => LyricsScreenViewModel());
  serviceLocator.registerFactory<FoundWordsScreenViewModel>(
      () => FoundWordsScreenViewModel());
}
