import 'package:yalla_harek/core/data/datasources/local/app_database.dart';
import 'package:yalla_harek/core/data/datasources/local/entities/game_entity.dart';
import 'package:yalla_harek/features/addandeditgame/domain/entities/game.dart';
import 'package:yalla_harek/features/addandeditgame/domain/repositories/add_and_edit_game_repository.dart';

class AddAndEditGameRepositoryImpl implements AddAndEditGameRepository {
  final AppDatabase _appDatabase;

  AddAndEditGameRepositoryImpl(this._appDatabase);

  @override
  Future<void> insertGame(Game game) {
    return _appDatabase.gameDAO.insertGame(GameEntity(
      title: game.title!,
      countOfPlayers: game.countOfPlayers!,
      date: game.date!,
      description: game.description,
      image: game.image,
    ));
  }

  @override
  Future<void> updateGame(Game game) {
    // TODO: implement updateGame
    return _appDatabase.gameDAO.updateGame(GameEntity(
      title: game.title!,
      countOfPlayers: game.countOfPlayers!,
      date: game.date!,
      id: game.id!,
      description: game.description!,
    ));
  }
}
