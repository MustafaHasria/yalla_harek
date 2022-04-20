part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetAllGamesEvent extends MainEvent {}

class DeleteGameEvent extends MainEvent {
  final GameEntity game;

  DeleteGameEvent({required this.game});


}
