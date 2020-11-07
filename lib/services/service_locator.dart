import 'package:get_it/get_it.dart';
import 'package:lyrics_guru/busines_logic/view_models/artists_screen_viewmodel.dart';

import 'library/library_service.dart';
import 'library/library_service_fake.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator
      .registerLazySingleton<LibraryService>(() => LibraryServiceFake());
  serviceLocator
      .registerFactory<ArtistsSreenViewModel>(() => ArtistsSreenViewModel());
}
