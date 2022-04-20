import 'package:yalla_harek/core/usecase/usecase.dart';
import 'package:yalla_harek/features/addandeditgame/domain/entities/game.dart';
import 'package:yalla_harek/features/addandeditgame/domain/repositories/add_and_edit_game_repository.dart';

class SaveGameUseCase extends UseCase<void, Game> {
  final AddAndEditGameRepository _addGameRepository;

  SaveGameUseCase(this._addGameRepository);

  @override
  Future<void> call({required Game params}) {
    return _addGameRepository.insertGame(params);
  }
}