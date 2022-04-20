import 'package:flutter/material.dart';
import 'package:yalla_harek/features/addandeditgame/presentation/views/add_and_edit_game_screen.dart';
import 'package:yalla_harek/injector.dart';

import 'core/common/app_color.dart';
import 'features/main/presentation/views/main_screen.dart';
import 'features/splash/splash_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const YallaHarek());
}

class YallaHarek extends StatelessWidget {
  const YallaHarek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yalla Harek',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: MyColors.primary,
          centerTitle: true,
          elevation: 0.0,
        ),
        primaryColor: MyColors.primary,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        AddAndEditGameScreen.id: (context) => const AddAndEditGameScreen(),
        MainScreen.id: (context) => const MainScreen(),
      },
    );
  }
}
