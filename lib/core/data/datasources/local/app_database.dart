

import 'package:floor/floor.dart';
import 'package:yalla_harek/core/data/datasources/local/DAOs/game_dao.dart';

import 'entities/game_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [GameEntity])
abstract class AppDatabase extends FloorDatabase{
  GameDAO get gameDAO;

}