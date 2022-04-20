part of 'add_and_edit_game_bloc.dart';

abstract class AddAndEditGameEvent extends Equatable {
  AddAndEditGameEvent();

  @override
  List<Object> get props => [];
}

class UpdateOrInsertGameEvent extends AddAndEditGameEvent {
  final Game game;

  UpdateOrInsertGameEvent({required this.game});
}

