import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yalla_harek/features/addandeditgame/domain/entities/game.dart';
import 'package:yalla_harek/features/addandeditgame/domain/usecases/save_game_usecase.dart';
import 'package:yalla_harek/features/addandeditgame/domain/usecases/update_game_usecase.dart';

part 'add_and_edit_game_event.dart';

part 'add_and_edit_game_state.dart';

class AddAndEditGameBloc
    extends Bloc<AddAndEditGameEvent, AddAndEditGameState> {
  final SaveGameUseCase _saveGameUseCase;
  final UpdateGameUseCase _updateGameUseCase;

  AddAndEditGameBloc(this._updateGameUseCase, this._saveGameUseCase)
      : super(AddAndEditGameInitial()) {
    on<UpdateOrInsertGameEvent>((event, emit) async {
      emit(AddAndEditGameLoading());
      if (event.game.id == null) {
        await _saveGameUseCase(params: event.game);
      } else {
        await _updateGameUseCase(params: event.game);
      }
      emit(AddAndEditGameDone());
    });
  }
}
