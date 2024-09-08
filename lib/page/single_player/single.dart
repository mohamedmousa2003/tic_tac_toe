import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xo_game/core/constants/app_colors.dart';
import 'package:xo_game/generated/l10n.dart';
import 'package:xo_game/share/components/components.dart';

class computer extends StatefulWidget {
  const computer({super.key});
  static const String routeName = "computer";
  @override
  State<computer> createState() => _computerState();
}

class _computerState extends State<computer> {
  List sq = List.filled(9, '');
  String winnerPlayer = "";
  int xSocre = 0, oScore = 0, drawScore = 0;
  bool isPlay = true, isWin = false;
  getWinner() {
    List winIndex = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    for (var i = 0; i < winIndex.length; i++) {
      String a = sq[winIndex[i][0]];
      String b = sq[winIndex[i][1]];
      String c = sq[winIndex[i][2]];
      if (a == b && b == c && a != "") {
        return a;
      }
    }
    if (!sq.contains("")) {
      return "Draw";
    }
    return "";
  }

  clearBoard() {
    setState(() {
      for (var i = 0; i < sq.length; i++) {
        sq[i] = "";
      }
    });
  }

  Timer? timer;

  startTimer(bool com) {
    setState(() {
      isPlay = false;
      isWin = true;
    });
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        clearBoard();
        setState(() {
          isPlay = true;
          isWin = false;
        });
        if (com) {
          playComputer();
        }
        timer.cancel();
      },
    );
  }

  // alog Compyter Play
  playComputer() {
    // play => X
    // computer => O
    /*
    1- win O
    2- deafeat X
    3- play any way
     */
    List winIndex = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    // win O
    for (var i = 0; i < winIndex.length; i++) {
      String a = sq[winIndex[i][0]];
      String b = sq[winIndex[i][1]];
      String c = sq[winIndex[i][2]];
      if (a == b && a == 'O' && c == '') {
        sq[winIndex[i][2]] = 'O';
        return;
      }
      if (a == c && a == 'O' && b == '') {
        sq[winIndex[i][1]] = 'O';
        return;
      }
      if (c == b && b == 'O' && a == '') {
        sq[winIndex[i][0]] = 'O';
        return;
      }
    }
    // win O

    // defeat X
    for (var i = 0; i < winIndex.length; i++) {
      String a = sq[winIndex[i][0]];
      String b = sq[winIndex[i][1]];
      String c = sq[winIndex[i][2]];
      if (a == b && a == 'X' && c == '') {
        sq[winIndex[i][2]] = 'O';
        return;
      }
      if (a == c && a == 'X' && b == '') {
        sq[winIndex[i][1]] = 'O';
        return;
      }
      if (c == b && b == 'X' && a == '') {
        sq[winIndex[i][0]] = 'O';
        return;
      }
    }
    // defeat X

    // paly any way
    List indxes = [0, 1, 2, 3, 4, 5, 7, 8]; // index of sq
    indxes.shuffle(Random());
    for (var i = 0; i < sq.length; i++) {
      if (sq[indxes[i]] == "") {
        sq[indxes[i]] = 'O';
        return;
      }
    }
    // paly any way
  }

  // alog Compyter Play
  @override
  Widget build(BuildContext context) {
    var local = S.of(context);
    var theme = Theme.of(context);
    var  mediaQuery=MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/image/background.jpeg"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            local.computer,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: blue,
              fontWeight: FontWeight.bold,
              fontSize: 35
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
              50.height,
              Row(
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
                    child: const Text(
                      "Mohamed",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    xSocre.toString(),
                    style: theme.textTheme.bodyLarge?.copyWith(
                        color: blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  Text(
                    ":",
                    style: theme.textTheme.bodyLarge?.copyWith(
                        color: blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  Text(
                    oScore.toString(),
                    style: theme.textTheme.bodyLarge?.copyWith(
                        color: blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
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
                    child: Text(
                      local.computer,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              50.height,
              Expanded(
                child: GridView.builder(
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5.0,
                      mainAxisExtent: mediaQuery.height*0.2,
                      childAspectRatio: 100 / 100,
                      crossAxisSpacing: 5.0),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        if (sq[index] == "" && isPlay) {
                          sq[index] = "X";
                          winnerPlayer = getWinner();
                          if (winnerPlayer == "X") {
                            messageDraw("Mohamed ${local.win}", "assets/image/trophy (2) 1.png");
                            xSocre++;
                            startTimer(false);
                          } else if (winnerPlayer == "O") {
                            messageDraw("hello", "assets/image/trophy (2) 1.png");
                            oScore++;
                            startTimer(true);
                          } else if (winnerPlayer == "Draw") {
                            messageDraw("draw", "assets/image/draw 1.png");
                            drawScore++;
                            startTimer(false);
                          } else {
                            playComputer();
                            winnerPlayer = getWinner();
                            if (winnerPlayer == "O") {
                               messageDraw("Mohamed ${local.lose}", "assets/image/sad 1.png");
                              oScore++;
                              startTimer(true);
                            } else if (winnerPlayer == "Draw") {
                              messageDraw("${local.draw}", "assets/image/draw 1.png");
                              drawScore++;
                              startTimer(true);
                            }
                          }
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 5.0)),
                      child:Center(
                          child: Text(
                        sq[index],
                        style: TextStyle(
                          fontSize: 50,
                          color:sq[index] == "X" ? green : red
                        ),
                      )),
                    ),
                  ),
                  itemCount: sq.length,
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }

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
