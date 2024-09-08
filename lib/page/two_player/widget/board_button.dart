import 'package:flutter/material.dart';
import 'package:xo_game/core/constants/app_colors.dart';

class BoardButton extends StatelessWidget {
  BoardButton({super.key , required this.text ,required this.onTap ,required this.index});
  String text;
  int index;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 15 ,left: 5,right: 5,bottom: 15),
          child: InkWell(
            onTap: (){
              onTap(index);
            },
            child: Container(
                        decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 5.0)),
                        child:Center(
                            child: Text(
                          text,
                          style: theme.textTheme.bodyLarge?.copyWith(
                color: text=="X"? green : red,
                fontSize: text=="X"? 35 : 45,
              ),),
                      ),
                    
            ),
          ),
        ));
  }
}


// Color(0xff0e1e3a),