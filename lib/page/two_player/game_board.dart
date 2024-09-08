import 'package:flutter/material.dart';
import 'package:xo_game/core/constants/app_colors.dart';
import 'package:xo_game/generated/l10n.dart';
import 'package:xo_game/page/two_player/widget/board_button.dart';
import 'package:xo_game/page/two_player/widget/game_board_args.dart';
import 'package:xo_game/share/components/components.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});
  static const String routeName = "game_board";

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> borderState = List.filled(9, '');
  int playerX = 0;
  int playerO = 0;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    GameBoardArgs args =ModalRoute.of(context)!.settings.arguments as GameBoardArgs;
    return Container(
      decoration: const BoxDecoration(
       image: DecorationImage(image:AssetImage("assets/image/background.jpeg"),fit:BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              alignment: Alignment(0, 0.5),
                              image: AssetImage("assets/image/xxxxx 1.png"))),
                      child:  Text(
                        args.playerOne,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      playerX.toString(),
                      style: theme.textTheme.bodyLarge?.copyWith(
                          color: blue, fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      ":",
                      style: theme.textTheme.bodyLarge?.copyWith(
                          color: blue, fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      playerO.toString(),
                      style: theme.textTheme.bodyLarge?.copyWith(
                          color: blue, fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              alignment: Alignment(0, 0.5),
                              image: AssetImage("assets/image/OOO 1.png"))),
                      child:  Text(
                        args.playerTwo,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardButton(
                    onTap: onButtonClick,
                    text: borderState[0],
                    index: 0,
                  ),
                  BoardButton(
                    onTap: onButtonClick,
                    text: borderState[1],
                    index: 1,
                  ),
                  BoardButton(
                    onTap: onButtonClick,
                    text: borderState[2],
                    index: 2,
                  ),
                ],
              )),
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardButton(
                    onTap: onButtonClick,
                    text: borderState[3],
                    index: 3,
                  ),
                  BoardButton(
                    onTap: onButtonClick,
                    text: borderState[4],
                    index: 4,
                  ),
                  BoardButton(
                    onTap: onButtonClick,
                    text: borderState[5],
                    index: 5,
                  ),
                ],
              )),
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardButton(
                    onTap: onButtonClick,
                    text: borderState[6],
                    index: 6,
                  ),
                  BoardButton(
                    onTap: onButtonClick,
                    text: borderState[7],
                    index: 7,
                  ),
                  BoardButton(
                    onTap: onButtonClick,
                    text: borderState[8],
                    index: 8,
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  int counter = 0;

  void onButtonClick(int index) {
    GameBoardArgs args =ModalRoute.of(context)!.settings.arguments as GameBoardArgs;
    if (borderState[index] != "") {
      return;
    }
    if (counter.isEven) {
      borderState[index] = "X";
    } else {
      borderState[index] = "O";
    }
    counter++;
    if (checkWinner('X')) {
      playerX++;
      messageDraw("${S.of(context).win} ${args.playerOne} ", "assets/image/trophy (2) 1.png");
      intBoard();
    } else if (checkWinner("O")) {
      playerO++;
      intBoard();
      messageDraw("${S.of(context).win} ${args.playerTwo}", "assets/image/trophy (2) 1.png");
    } else if (counter == 9) {
      intBoard();
      messageDraw(S.of(context).draw, "assets/image/draw 1.png");
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    // if(borderState[0]==symbol && borderState[1]==symbol && borderState[2]==symbol){
    //   return true;
    // }
    // if(borderState[3]==symbol && borderState[4]==symbol && borderState[5]==symbol){
    //   return true;
    // }
    // if(borderState[6]==symbol && borderState[7]==symbol && borderState[8]==symbol){
    //   return true;
    // }
    for (int i = 0; i < 9; i += 3) {
      if (borderState[i] == symbol &&
          borderState[i + 1] == symbol &&
          borderState[i + 2] == symbol) {
        return true;
      }
    }
    // if(borderState[0]==symbol && borderState[3]==symbol && borderState[6]==symbol){
    //   return true;
    // }
    // if(borderState[1]==symbol && borderState[4]==symbol && borderState[7]==symbol){
    //   return true;
    // }
    // if(borderState[2]==symbol && borderState[5]==symbol && borderState[8]==symbol){
    //   return true;
    // }
    for (int i = 0; i < 3; i++) {
      if (borderState[i] == symbol &&
          borderState[i + 3] == symbol &&
          borderState[i + 6] == symbol) {
        return true;
      }
    }

    if (borderState[0] == symbol &&
        borderState[4] == symbol &&
        borderState[8] == symbol) {
      return true;
    }
    if (borderState[2] == symbol &&
        borderState[4] == symbol &&
        borderState[6] == symbol) {
      return true;
    }
    return false;
  }

  void intBoard() {
    borderState = List.filled(9, '');
    counter = 0;
  }
  

  /// to show dialog when win or draw
  void messageDraw(String text, String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var local = S.of(context);
        return AlertDialog(
          backgroundColor: blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 26, color: primary),
                textAlign: TextAlign.center,
              ),
              20.height,
              Image.asset(
                image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text(
                local.ok,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

}
