import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo_game/core/constants/app_colors.dart';
import 'package:xo_game/generated/l10n.dart';
import 'package:xo_game/page/auth/login/login_view.dart';
import 'package:xo_game/page/setting/widget/bottom_language.dart';
import 'package:xo_game/share/components/components.dart';
import 'package:xo_game/share/provider/provider_share.dart';


class SettingView extends StatefulWidget {
  const SettingView({super.key});
  static String routeName = "setting";
  @override
  State<SettingView> createState() => _SettingViewState();
}
class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var local =S.of(context);
    var provider = Provider.of<MyProvider>(context);
    return  Container(
      decoration: const BoxDecoration(
       image: DecorationImage(image:AssetImage("assets/image/background.jpeg"),fit:BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.height,
                Text(local.language ,style:  theme.textTheme.bodyLarge?.copyWith(color: black ),),
                15.height,  
                builderSetting(
                      locale: provider.localeProvider == "en" 
                          ? local.english :provider.localeProvider == "de" ? local.german  :provider.localeProvider == "fr" ?local.french
                          : local.arabic
                          
                  ),

                  50.height,

                  InkWell(
                    onTap: (){
                      Navigator.popAndPushNamed(context, Login.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.logout ,color: blue,size: 35,),
                        12.width,
                        Text(local.logout ,style:theme.textTheme.bodyLarge?.copyWith(color: blue ),),
                      ],
                    ),
                  ),
                  15.height,  
                  
              ],
            ),
          )),
    );
  }
//{/*required String local*/}
builderSetting({required String locale}) {
  var local = S.of(context);
  var theme = Theme.of(context);
    return InkWell(
      onTap: () {
         builderShowModalBottomLanguage();
           },
      child: Container(
        
        padding: const EdgeInsets.all(10),
        height: 60,
        width: double.infinity,
        decoration:
            BoxDecoration(border: Border.all(color: blue, width: 3)),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //local
            Text(locale, style: theme.textTheme.bodyLarge?.copyWith(color: blue , fontSize: 25)),
            const Icon(
              Icons.arrow_downward,
              color: blue,
            ),
          ],
        ),
      ),
    );
  }

builderShowModalBottomLanguage() {
    return showModalBottomSheet(
      
        context: context, builder: (context) => BottomLanguage());
  }
}