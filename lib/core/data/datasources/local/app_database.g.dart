// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  GameDAO? _gameDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `GameEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL, `description` TEXT, `countOfPlayers` INTEGER NOT NULL, `date` TEXT NOT NULL, `image` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  GameDAO get gameDAO {
    return _gameDAOInstance ??= _$GameDAO(database, changeListener);
  }
}

class _$GameDAO extends GameDAO {
  _$GameDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _gameEntityInsertionAdapter = InsertionAdapter(
            database,
            'GameEntity',
            (GameEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'countOfPlayers': item.countOfPlayers,
                  'date': item.date,
                  'image': item.image
                }),
        _gameEntityUpdateAdapter = UpdateAdapter(
            database,
            'GameEntity',
            ['id'],
            (GameEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'countOfPlayers': item.countOfPlayers,
                  'date': item.date,
                  'image': item.image
                }),
        _gameEntityDeletionAdapter = DeletionAdapter(
            database,
            'GameEntity',
            ['id'],
            (GameEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'countOfPlayers': item.countOfPlayers,
                  'date': item.date,
                  'image': item.image
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GameEntity> _gameEntityInsertionAdapter;

  final UpdateAdapter<GameEntity> _gameEntityUpdateAdapter;

  final DeletionAdapter<GameEntity> _gameEntityDeletionAdapter;

  @override
  Future<List<GameEntity>> getAllGames() async {
    return _queryAdapter.queryList('Select * from GameEntity',
        mapper: (Map<String, Object?> row) => GameEntity(
            id: row['id'] as int?,
            title: row['title'] as String,
            description: row['description'] as String?,
            countOfPlayers: row['countOfPlayers'] as int,
            date: row['date'] as String,
            image: row['image'] as String?));
  }

  @override
  Future<void> deleteAllGames() async {
    await _queryAdapter.queryNoReturn('Delete from GameEntity');
  }

  @override
  Future<void> insertGame(GameEntity gameEntity) async {
    await _gameEntityInsertionAdapter.insert(
        gameEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateGame(GameEntity gameEntity) async {
    await _gameEntityUpdateAdapter.update(gameEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteGame(GameEntity gameEntity) async {
    await _gameEntityDeletionAdapter.delete(gameEntity);
  }
}
