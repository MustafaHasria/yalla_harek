import 'package:yalla_harek/core/data/datasources/local/entities/game_entity.dart';
import 'package:yalla_harek/core/usecase/usecase.dart';
import 'package:yalla_harek/features/addandeditgame/domain/entities/game.dart';
import 'package:yalla_harek/features/main/domain/repositories/main_repository.dart';

class DeleteGameUsecase implements UseCase<void, GameEntity> {
  final MainRepository _mainRepository;

  DeleteGameUsecase(this._mainRepository);

  @override
  Future<void> call({required GameEntity params}) {
    return _mainRepository.deleteGame(params);
  }
}
