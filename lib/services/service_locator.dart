import 'package:get_it/get_it.dart';
import 'package:lyrics_guru/busines_logic/view_models/learn_page/artist_specific_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/learn_page/learn_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/learn_page/word_definition_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/learn_page/word_list_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/library_page/albums_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/library_page/artists_screen_viewmodel.dart';
import 'package:lyrics_guru/busines_logic/view_models/library_page/tracks_screen_viewmodel.dart';

import 'learn/learn_service.dart';
import 'learn/learn_service_fake.dart';
import 'library/library_service.dart';
import 'library/library_service_fake.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator
      .registerLazySingleton<LibraryService>(() => LibraryServiceFake());
  serviceLocator.registerLazySingleton<LearnService>(() => LearnServiceFake());

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
}
