import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_harek/core/data/datasources/local/entities/game_entity.dart';
import 'package:yalla_harek/features/addandeditgame/presentation/views/add_and_edit_game_screen.dart';
import 'package:yalla_harek/features/main/presentation/blocs/main_bloc.dart';
import 'package:yalla_harek/features/main/presentation/widgets/game_widget.dart';
import 'package:yalla_harek/injector.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainBloc? mainBloc;

  @override
  void initState() {
    mainBloc = injector<MainBloc>()..add(GetAllGamesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mainBloc!,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, AddAndEditGameScreen.id).then((value) {
              mainBloc!..add(GetAllGamesEvent());
            });
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Game', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is MainLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is MainLoaded) {
          return RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: _buildArticlesList(state.gameEntityList!),
            onRefresh: () async {
              mainBloc!..add(GetAllGamesEvent());
            },
          );
        } else
          return Container();
      },
    );
  }

  Widget _buildArticlesList(List<GameEntity> games) {
    if (games.isEmpty) {
      return const Center(
          child: Text(
        'NO SAVED GAMES',
        style: TextStyle(color: Colors.black),
      ));
    }
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        return GameWidget(
          game: games[index],
          mainBloc: mainBloc,
        );
      },
    );
  }
}
