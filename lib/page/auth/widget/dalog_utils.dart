import 'package:flutter/material.dart';
import 'package:xo_game/core/constants/app_colors.dart';
import 'package:xo_game/share/components/components.dart';

class DialogUtils {
  // show load
  static void showLoading(BuildContext context, String text) {
    var theme =Theme.of(context);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          
          content: Row(
            children: [
               CircularProgressIndicator(
                backgroundColor: transparent,
                color: blue,
              ),
               15.width,
              Text(text,style: theme.textTheme.bodyLarge?.copyWith(
                color: blue,
                fontSize: 25,
              ),),
            ],
          ),
        );
      },
    );
  }

  // hide loading
  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  // show message
  static void showMessage(
    BuildContext context,
    String messageContent, {
    String? messageTitle,
    String? posActionName,
    Function? onPressedPosActionName,
    String? negActionName,
    Function? onPressedNegActionName,
    bool barrierDismissible = true,
    TextStyle? titleTextStyle,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            onPressedPosActionName?.call();
          },
          child: Text(posActionName)));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            onPressedNegActionName?.call();
          },
          child: Text(negActionName)));
    }
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(messageContent ,style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 25,
           
          ),),
          title: Text(messageTitle ?? "Title" ,style: Theme.of(context).textTheme.bodyLarge?.copyWith(
           
            color: blue,
          ),),
          titleTextStyle: titleTextStyle,
          actions: actions,
        );
      },
    );
  }
}
