// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Please enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password not less than 6 characters`
  String get enterPasswordLess {
    return Intl.message(
      'Please enter a password not less than 6 characters',
      name: 'enterPasswordLess',
      desc: '',
      args: [],
    );
  }

  /// `Do not have an account ? `
  String get noHaveAccount {
    return Intl.message(
      'Do not have an account ? ',
      name: 'noHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account ? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account ? ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Single Player`
  String get singlePlayer {
    return Intl.message(
      'Single Player',
      name: 'singlePlayer',
      desc: '',
      args: [],
    );
  }

  /// `Two Player`
  String get twoPlayer {
    return Intl.message(
      'Two Player',
      name: 'twoPlayer',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `عربي`
  String get arabic {
    return Intl.message(
      'عربي',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `German`
  String get german {
    return Intl.message(
      'German',
      name: 'german',
      desc: '',
      args: [],
    );
  }

  /// `Draw`
  String get draw {
    return Intl.message(
      'Draw',
      name: 'draw',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Win`
  String get win {
    return Intl.message(
      'Win',
      name: 'win',
      desc: '',
      args: [],
    );
  }

  /// `Player One`
  String get playerOne {
    return Intl.message(
      'Player One',
      name: 'playerOne',
      desc: '',
      args: [],
    );
  }

  /// `Player Two`
  String get playerTwo {
    return Intl.message(
      'Player Two',
      name: 'playerTwo',
      desc: '',
      args: [],
    );
  }

  /// `Let is play`
  String get letPlay {
    return Intl.message(
      'Let is play',
      name: 'letPlay',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your player`
  String get enterYourPlayer {
    return Intl.message(
      'Please enter your player',
      name: 'enterYourPlayer',
      desc: '',
      args: [],
    );
  }

  /// `Enter player names`
  String get enternames {
    return Intl.message(
      'Enter player names',
      name: 'enternames',
      desc: '',
      args: [],
    );
  }

  /// `Français`
  String get french {
    return Intl.message(
      'Français',
      name: 'french',
      desc: '',
      args: [],
    );
  }

  /// `Start Game`
  String get startGame {
    return Intl.message(
      'Start Game',
      name: 'startGame',
      desc: '',
      args: [],
    );
  }

  /// `Computer`
  String get computer {
    return Intl.message(
      'Computer',
      name: 'computer',
      desc: '',
      args: [],
    );
  }

  /// `Lose`
  String get lose {
    return Intl.message(
      'Lose',
      name: 'lose',
      desc: '',
      args: [],
    );
  }

  /// `TIC TAC TOE`
  String get ticTacToe {
    return Intl.message(
      'TIC TAC TOE',
      name: 'ticTacToe',
      desc: '',
      args: [],
    );
  }

  /// `Password Not Match`
  String get passwordNotMatch {
    return Intl.message(
      'Password Not Match',
      name: 'passwordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please enter your email',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get pleaseEnterAValidEmailAddress {
    return Intl.message(
      'Please enter a valid email address',
      name: 'pleaseEnterAValidEmailAddress',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de', countryCode: 'DE'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
