import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/core/constants/app_colors.dart';
import 'package:xo_game/generated/l10n.dart';
import 'package:xo_game/page/home/widget/design.dart';
import 'package:xo_game/page/setting/setting_view.dart';
import 'package:xo_game/page/single_player/game_board.dart';
import 'package:xo_game/page/single_player/single.dart';
import 'package:xo_game/page/two_player/player_screen.dart';
import 'package:xo_game/share/components/components.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});
  static const String routeName = "home";
  @override
  Widget build(BuildContext context) {
    var local =S.of(context);
    var theme =Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
       image: DecorationImage(image:AssetImage("assets/image/background.jpeg"),fit:BoxFit.cover),
      ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           


            Text(local.ticTacToe ,style:  theme.textTheme.bodyLarge?.copyWith(color: blue,fontWeight: FontWeight.bold,fontSize: 40),) ,
           40.height,
            Design(
              onTap: (){
                Navigator.pushNamed(context, computer.routeName);
              },
              padding: 20,
              image: "assets/image/single.png",
              colorImage: primary,
               circleContainer: blue,
                boxDecorationContainer: blue,
                 borderContainer: blue, text: local.singlePlayer
            ),
            15.height,
            Design(
              onTap: (){
                Navigator.pushNamed(context, PlayerScreen.routeName);
              },
              padding: 30,
              image: "assets/image/play (1) 1.png",
               circleContainer: blue,
                boxDecorationContainer: blue,
                colorImage: primary,
                 borderContainer: blue, text: local.twoPlayer
                 ),
                
            15.height,
            Design(
              onTap: (){
                Navigator.pushNamed(context, SettingView.routeName);
              },
              padding: 30,
              image: "assets/image/Icon feather-settings.png",
               circleContainer: blue,
                boxDecorationContainer: blue,
                colorImage: primary,
                 borderContainer: blue, text: local.setting
            ),
          ],
        )
        ),
    );
  }
  List<Color> colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];
}