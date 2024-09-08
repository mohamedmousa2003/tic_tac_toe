import 'package:flutter/material.dart';
import 'package:xo_game/core/constants/app_colors.dart';
import 'package:xo_game/generated/l10n.dart';
import 'package:xo_game/page/two_player/game_board.dart';
import 'package:xo_game/page/two_player/widget/game_board_args.dart';
import 'package:xo_game/share/components/components.dart';
import 'package:xo_game/share/components/custom_text_field.dart';

class PlayerScreen extends StatelessWidget {
  PlayerScreen({super.key});
  static String routeName = "player_screen";
  var playerTwo = TextEditingController();

  var playerOne = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var local = S.of(context);
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
       image: DecorationImage(image:AssetImage("assets/image/background.jpeg"),fit:BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
             
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text(local.enternames ,
               textAlign: TextAlign.center ,style: theme.textTheme.bodyLarge?.copyWith(
                 color: blue,
                 fontWeight: FontWeight.bold ,
                 fontSize: 32
               ),),
                40.height,
                CustomTextField(
                  controller: playerOne,
                  label: local.playerOne,
                   prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/image/x.png" ),
                  ),
                  onValidate: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return local.enterYourPlayer;
                    }
                    
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                10.height,
                CustomTextField(
                  controller: playerTwo,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/image/o.png" ),
                  ),
                  
                  label: local.playerTwo,
                  onValidate: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return local.enterYourPlayer;
                    }
                    return null;
                  },
                
                ),
                30.height,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: blue,
                      padding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  onPressed: () {
                     if (formKey.currentState?.validate() == true) {
                      Navigator.pushNamed(context, GameBoard.routeName ,
                     arguments: GameBoardArgs(
                      playerOne: playerOne.text,
                      
                      playerTwo: playerTwo.text,
                     ),
                    );
                     }
                    
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        local.startGame,
                        style: theme.textTheme.bodyMedium,
                      )),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: primary,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
