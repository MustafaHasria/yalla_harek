import 'package:yalla_harek/core/data/datasources/local/entities/game_entity.dart';
import 'package:yalla_harek/core/usecase/usecase.dart';
import 'package:yalla_harek/features/addandeditgame/domain/entities/game.dart';
import 'package:yalla_harek/features/main/domain/repositories/main_repository.dart';

class GetGamesUsecase implements UseCase<List<GameEntity>, NoParams> {
  final MainRepository _mainRepository;

  GetGamesUsecase(this._mainRepository);

  @override
  Future<List<GameEntity>> call({required NoParams params}) {
    return _mainRepository.getAllGames();
  }
}
