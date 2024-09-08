import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo_game/core/constants/app_colors.dart';
import 'package:xo_game/page/auth/login/login_view.dart';
import 'package:xo_game/share/components/components.dart';
import 'package:xo_game/share/provider/provider_share.dart';

import '../../../generated/l10n.dart';



class BottomLanguage extends StatelessWidget {
  const BottomLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    var local = S.of(context);
    var theme = Theme.of(context);
    var provider = Provider.of<MyProvider>(context);
    return Container(
      decoration:const BoxDecoration(
       image: DecorationImage(image:AssetImage("assets/image/background.jpeg"),fit:BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // English language
            InkWell(
              onTap: () {
                provider.chanageLanguage("en");
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    local.english,
                    
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color:
                      
                      provider.localeProvider == "en"
                          ? blue
                          : black,
                      
                    ),
                  ),
                  
                  provider.localeProvider == "en"
                      ? Icon(Icons.done, color: blue ,size: 35,)
                      : const SizedBox.shrink(),
                  
                ],
              ),
            ),
            20.height,
            // Arabic language
            InkWell(
              onTap: () {
                provider.chanageLanguage("ar");
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    local.arabic,
                   
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: provider.localeProvider == "ar"
                          ? blue
                          : black,
                       
                    ),
                  ),
                  
                  provider.localeProvider == "ar"
                      ? Icon(Icons.done, color: blue,size: 35)
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            //German language
            20.height,
            InkWell(
              onTap: () {
                provider.chanageLanguage("de");
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    local.german,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: provider.localeProvider == "de"
                          ? blue
                          : black,
                       
                    ),
                  ),
                  provider.localeProvider == "de"
                      ? Icon(Icons.done, color: blue,size: 35)
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            20.height,
            InkWell(
              onTap: () {
                provider.chanageLanguage("fr");
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    local.french,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: provider.localeProvider == "fr"
                          ? blue
                          : black,
                       
                    ),
                  ),
                  provider.localeProvider == "fr"
                      ? Icon(Icons.done, color: blue,size: 35)
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
