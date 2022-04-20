import 'package:floor/floor.dart';
import 'package:yalla_harek/core/data/datasources/local/entities/game_entity.dart';


@dao
abstract class GameDAO{
  @Query('Select * from GameEntity')
  Future<List<GameEntity>> getAllGames();

  @Query('Delete from GameEntity')
  Future<void> deleteAllGames();

  @insert
  Future<void> insertGame(GameEntity gameEntity);

  @update
  Future<void> updateGame(GameEntity gameEntity);

  @delete
  Future<void> deleteGame(GameEntity gameEntity);
}