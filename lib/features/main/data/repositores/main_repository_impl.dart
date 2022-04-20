import 'package:yalla_harek/core/data/datasources/local/app_database.dart';
import 'package:yalla_harek/core/data/datasources/local/entities/game_entity.dart';
import 'package:yalla_harek/features/addandeditgame/domain/entities/game.dart';
import 'package:yalla_harek/features/main/domain/repositories/main_repository.dart';

class MainRepositoryImpl implements MainRepository{
  final AppDatabase _appDatabase;

  MainRepositoryImpl(this._appDatabase);

  @override
  Future<List<GameEntity>> getAllGames() {
    return _appDatabase.gameDAO.getAllGames();
  }

  @override
  Future<void> deleteGame(GameEntity gameEntity) async {
    _appDatabase.gameDAO.deleteGame(gameEntity);
  }

}