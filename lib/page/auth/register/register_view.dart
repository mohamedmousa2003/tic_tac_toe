import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/core/constants/app_colors.dart';
import 'package:xo_game/core/constants/app_string.dart';
import 'package:xo_game/generated/l10n.dart';
import 'package:xo_game/page/auth/login/login_view.dart';
import 'package:xo_game/page/auth/widget/dalog_utils.dart';
import 'package:xo_game/share/components/components.dart';
import 'package:xo_game/share/components/custom_text_field.dart';

class Register extends StatefulWidget {
  Register({super.key});
  static const String routeName = "register";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final local = S.of(context);
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
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
               
                children: [
                  60.height,
                  Image.asset("assets/image/splash.png", fit: BoxFit.fill, width: 100, height: 100),
                  30.height,
                  Text(local.register ,style: theme.textTheme.bodyLarge?.copyWith(
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
                        return local.pleaseEnterYourEmail;
                      }
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                          .hasMatch(text);
                      if (!emailValid) {
                        return local.pleaseEnterAValidEmailAddress;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10),
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
                  SizedBox(height: 10),
                  CustomTextField(
                    controller: confirmPasswordController,
                    label: local.confirmPassword,
                    onValidate: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return local.enterYourPassword;
                      }
                      if (text != passwordController.text) {
                        return local.passwordNotMatch;
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
                      loginForm();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(local.register, style: theme.textTheme.bodyMedium)),
                        const Icon(Icons.arrow_forward_ios_outlined, color: primary, size: 28),
                      ],
                    ),
                  ),
                 40.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(local.alreadyHaveAccount, style: theme.textTheme.bodySmall),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          local.login,
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

  void loginForm() async {
    if (formKey.currentState?.validate() == true) {
      DialogUtils.showLoading(context,'Registering ...');
      await Future.delayed(const Duration(seconds: 2));
      DialogUtils.hideLoading(context);
    
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        DialogUtils.showMessage(context, 'Registration success');
        await Future.delayed(const Duration(seconds: 2));
        
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          DialogUtils.showMessage(context, 'The password provided is too weak.');
          
        } else if (e.code == 'email-already-in-use') {
          DialogUtils.showMessage(context, 'The account already exists for that email.');
          
        } else if (e.code == 'invalid-email') {
          DialogUtils.showMessage(context, 'The email address is not valid.');
         
        } else {
          DialogUtils.showMessage(context, 'Registration failed: ${e.message}');
          
        }
      }
    }
  }
}
