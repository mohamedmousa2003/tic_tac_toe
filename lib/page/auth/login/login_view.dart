import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/core/constants/app_colors.dart';
import 'package:xo_game/generated/l10n.dart';
import 'package:xo_game/page/auth/register/register_view.dart';
import 'package:xo_game/page/auth/widget/dalog_utils.dart';
import 'package:xo_game/page/home/home_view.dart';
import 'package:xo_game/share/components/components.dart';
import 'package:xo_game/share/components/custom_text_field.dart';

class Login extends StatelessWidget {
  Login({super.key});
  static const String routeName = "login";

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final local = S.of(context);
    final theme = Theme.of(context);
    return Container(
      decoration:const  BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/image/background.jpeg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  100.height,
                  Image.asset("assets/image/splash.png", fit: BoxFit.fill, width: 100, height: 100),
                  30.height,
                  Text(local.login ,style: theme.textTheme.bodyLarge?.copyWith(
                    color: blue,
                    fontWeight: FontWeight.bold ,
                    fontSize: 35
                  )),
                  40.height,
                  CustomTextField(
                    controller: emailController,
                    label: local.email,
                    onValidate: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return local.pleaseEnterYourEmail; //"pleaseEnterYourEmail": "Veuillez entrer votre e-mail",
                      }
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                          .hasMatch(text);
                      if (!emailValid) {
                        return local.pleaseEnterAValidEmailAddress;"Please enter a valid email address";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  10.height,
                  CustomTextField(
                    controller: passwordController,
                    label: local.password,
                    onValidate: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return local.enterYourPassword;
                      }
                      if (text.length < 6) {
                        return local.enterPasswordLess;
                      }
                      return null;
                    },
                    isPassword: true,
                  ),
                  30.height,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blue,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      loginForm(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(local.login, style: theme.textTheme.bodyMedium)),
                        const Icon(Icons.arrow_forward_ios_outlined, color: primary, size: 28),
                      ],
                    ),
                  ),
                  40.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(local.noHaveAccount, style: theme.textTheme.bodySmall),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Register.routeName);
                        },
                        child: Text(
                          local.register,
                          style: theme.textTheme.bodySmall?.copyWith(color: blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginForm(BuildContext context) async {
    var local =S.of(context);
    if (formKey.currentState?.validate() == true) {
      DialogUtils.showLoading(context,"${local.login} ...");
      await Future.delayed(const Duration(seconds: 2));
      DialogUtils.hideLoading(context);
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          DialogUtils.showMessage(context, 'No user found for that email.');
         
        } else if (e.code == 'wrong-password') {
          DialogUtils.showMessage(context, 'Wrong password provided for that user.');
         
        } else {
          DialogUtils.showMessage(context, 'Login failed: ${e.message}');
         
        }
      }
    }
  }
}
