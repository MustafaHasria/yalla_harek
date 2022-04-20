
import 'package:yalla_harek/core/resources/data_state.dart';
import 'package:yalla_harek/features/addandeditgame/domain/entities/game.dart';

abstract class AddAndEditGameRepository {

  // Database methods
  Future<void> insertGame(Game game);

  Future<void> updateGame(Game game);
}