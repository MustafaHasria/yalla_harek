part of 'main_bloc.dart';

@immutable
abstract class MainState extends Equatable{
}

class MainInitial extends MainState {
  @override
  List<Object?> get props => throw UnimplementedError();


}

class MainLoading extends MainState {
  @override
  List<Object?> get props => throw UnimplementedError();

}

class MainLoaded extends MainState {
  final List<GameEntity>? gameEntityList;

  MainLoaded({this.gameEntityList}) : super();

  @override
  List<Object?> get props => [gameEntityList];

}