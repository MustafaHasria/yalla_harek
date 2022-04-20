import 'package:floor/floor.dart';

@entity
class GameEntity {

  //region Property
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;
  final String? description;
  final int countOfPlayers;
  final String date;
  final String? image;

  //endregion

  //region Constructor
  GameEntity({
    this.id,
    required this.title,
    this.description,
    required this.countOfPlayers,
    required this.date,
    this.image,
  });
//endregion
}
