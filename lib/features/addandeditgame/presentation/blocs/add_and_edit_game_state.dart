part of 'add_and_edit_game_bloc.dart';

@immutable
abstract class AddAndEditGameState extends Equatable{

  @override
  List<Object> get props => [];
}

class AddAndEditGameInitial extends AddAndEditGameState {
  AddAndEditGameInitial();
}
class AddAndEditGameLoading extends AddAndEditGameState {
  AddAndEditGameLoading();
}

class AddAndEditGameDone extends AddAndEditGameState {
  AddAndEditGameDone();
}


