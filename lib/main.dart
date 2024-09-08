import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:xo_game/core/constants/theme/theme_view.dart';
import 'package:xo_game/firebase_options.dart';
import 'package:xo_game/generated/l10n.dart';
import 'package:xo_game/page/auth/login/login_view.dart';
import 'package:xo_game/page/auth/register/register_view.dart';
import 'package:xo_game/page/home/home_view.dart';
import 'package:xo_game/page/setting/setting_view.dart';
import 'package:xo_game/page/single_player/single.dart';
import 'package:xo_game/page/two_player/game_board.dart';
import 'package:xo_game/page/splash/splash_view.dart';
import 'package:xo_game/page/two_player/player_screen.dart';
import 'package:xo_game/share/provider/provider_share.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding is initialized

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale
      locale: Locale(provider.localeProvider),
      localizationsDelegates: const[
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
      supportedLocales: S.delegate.supportedLocales,
      // theme
      theme: ApplicationTheme.themeLight,
      // routes
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        Login.routeName: (context) =>  Login(),
        Register.routeName : (context) =>  Register(),
        HomeView.routeName : (context) =>   HomeView(),
        SettingView.routeName : (context) =>  SettingView(),
        GameBoard.routeName : (context) =>  GameBoard(),
        PlayerScreen.routeName : (context) =>  PlayerScreen(),
        computer.routeName : (context) =>  computer(),
      },
      
    );
  }
}

