import 'package:get_it/get_it.dart';
import 'package:yalla_harek/core/data/datasources/local/app_database.dart';
import 'package:yalla_harek/core/util/constants.dart';
import 'package:yalla_harek/features/addandeditgame/data/repositores/add_and_edit_game_repository_impl.dart';
import 'package:yalla_harek/features/addandeditgame/domain/repositories/add_and_edit_game_repository.dart';
import 'package:yalla_harek/features/addandeditgame/domain/usecases/save_game_usecase.dart';
import 'package:yalla_harek/features/addandeditgame/domain/usecases/update_game_usecase.dart';
import 'package:yalla_harek/features/addandeditgame/presentation/blocs/add_and_edit_game_bloc.dart';
import 'package:yalla_harek/features/main/domain/repositories/main_repository.dart';
import 'package:yalla_harek/features/main/domain/usecases/delete_game_usecase.dart';
import 'package:yalla_harek/features/main/domain/usecases/get_games_usecase.dart';

import 'features/main/data/repositores/main_repository_impl.dart';
import 'features/main/presentation/blocs/main_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder(kDatabaseName).build();
  injector.registerSingleton<AppDatabase>(database);

  //region Features

  //region Add and edit game
  //region Repositories
  injector.registerSingleton<AddAndEditGameRepository>(
    AddAndEditGameRepositoryImpl(injector()),
  );
  //endregion
  //region Usecases
  injector.registerSingleton<SaveGameUseCase>(SaveGameUseCase(injector()));
  injector.registerSingleton<UpdateGameUseCase>(UpdateGameUseCase(injector()));
  //endregion
  //region Bloc
  injector.registerFactory<AddAndEditGameBloc>(
      () => AddAndEditGameBloc(injector(), injector()));
  //endregion

  //endregion

  //region Main
  //region Repositories
  injector.registerSingleton<MainRepository>(
    MainRepositoryImpl(injector()),
  );
  //endregion
  //region Usecases
  injector.registerSingleton<GetGamesUsecase>(GetGamesUsecase(injector()));
  injector.registerSingleton<DeleteGameUsecase>(DeleteGameUsecase(injector()));
  //endregion
  //region Bloc
  injector.registerFactory<MainBloc>(
          () => MainBloc(injector(), injector()));
  //endregion

  //endregion

  //endregion
}
