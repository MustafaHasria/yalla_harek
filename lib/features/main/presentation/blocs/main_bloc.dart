import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yalla_harek/core/data/datasources/local/entities/game_entity.dart';
import 'package:yalla_harek/core/usecase/usecase.dart';
import 'package:yalla_harek/features/main/domain/usecases/delete_game_usecase.dart';
import 'package:yalla_harek/features/main/domain/usecases/get_games_usecase.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GetGamesUsecase getGamesUsecase;
  final DeleteGameUsecase deleteGameUsecase;

  MainBloc(this.getGamesUsecase, this.deleteGameUsecase)
      : super(MainInitial()) {
    on<DeleteGameEvent>((event, emit) async {
      emit(MainLoading());
      await deleteGameUsecase(params: event.game);
      final allGames = await getGamesUsecase(params: NoParams());
      emit(MainLoaded(gameEntityList: allGames));

    });

    on<GetAllGamesEvent>((event, emit) async {
      emit(MainLoading());
      final allGames = await getGamesUsecase(params: NoParams());
      emit(MainLoaded(gameEntityList: allGames));
    });
  }
}
