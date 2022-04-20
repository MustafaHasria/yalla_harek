import 'package:yalla_harek/core/data/datasources/local/entities/game_entity.dart';
import 'package:yalla_harek/features/addandeditgame/domain/entities/game.dart';

abstract class MainRepository{

  // Database methods
  Future<List<GameEntity>> getAllGames();

  Future<void> deleteGame(GameEntity gameEntity);


}