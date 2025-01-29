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

  /// `Flutter Base Kit`
  String get flutterBaseKit {
    return Intl.message(
      'Flutter Base Kit',
      name: 'flutterBaseKit',
      desc: '',
      args: [],
    );
  }

  /// `MIT License`
  String get onboardingTitle1 {
    return Intl.message(
      'MIT License',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `This project is licensed under the MIT License - see the [LICENSE](https://opensource.org/licenses/MIT) file for details.`
  String get onboardingDesc1 {
    return Intl.message(
      'This project is licensed under the MIT License - see the [LICENSE](https://opensource.org/licenses/MIT) file for details.',
      name: 'onboardingDesc1',
      desc: '',
      args: [],
    );
  }

  /// `Project Structure`
  String get onboardingTitle2 {
    return Intl.message(
      'Project Structure',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `A Flutter Base Kit using [MVVM](https://medium.com/flutterworld/flutter-mvvm-architecture-f8bed2521958) Design Architecture.`
  String get onboardingDesc2 {
    return Intl.message(
      'A Flutter Base Kit using [MVVM](https://medium.com/flutterworld/flutter-mvvm-architecture-f8bed2521958) Design Architecture.',
      name: 'onboardingDesc2',
      desc: '',
      args: [],
    );
  }

  /// `Getting Started`
  String get onboardingTitle3 {
    return Intl.message(
      'Getting Started',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `For help getting started with Flutter development, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.`
  String get onboardingDesc3 {
    return Intl.message(
      'For help getting started with Flutter development, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.',
      name: 'onboardingDesc3',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `next`
  String get next {
    return Intl.message(
      'next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `ok`
  String get ok {
    return Intl.message(
      'ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `get started`
  String get getStarted {
    return Intl.message(
      'get started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeScreenLabel {
    return Intl.message(
      'Home',
      name: 'homeScreenLabel',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profileScreenLabel {
    return Intl.message(
      'Profile',
      name: 'profileScreenLabel',
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

  /// `Simplified chinese`
  String get simplifiedChinese {
    return Intl.message(
      'Simplified chinese',
      name: 'simplifiedChinese',
      desc: '',
      args: [],
    );
  }

  /// `Oops, something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Oops, something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `The password you entered is too weak. Please choose a stronger password.`
  String get weakPassword {
    return Intl.message(
      'The password you entered is too weak. Please choose a stronger password.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `This email address is already in use. Please use a different email.`
  String get usedEmail {
    return Intl.message(
      'This email address is already in use. Please use a different email.',
      name: 'usedEmail',
      desc: '',
      args: [],
    );
  }

  /// `The email or password you entered is incorrect. Please try again.`
  String get invalidCredential {
    return Intl.message(
      'The email or password you entered is incorrect. Please try again.',
      name: 'invalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `Session Expired or User is not Authenticated, Please Login Again.`
  String get permissionDenied {
    return Intl.message(
      'Session Expired or User is not Authenticated, Please Login Again.',
      name: 'permissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `There was an error with your request. Please try again later.`
  String get requestError {
    return Intl.message(
      'There was an error with your request. Please try again later.',
      name: 'requestError',
      desc: '',
      args: [],
    );
  }

  /// `We have blocked all requests from this device due to unusual activity. Try again later.`
  String get tooManyRequests {
    return Intl.message(
      'We have blocked all requests from this device due to unusual activity. Try again later.',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
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

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Test Error`
  String get testError {
    return Intl.message(
      'Test Error',
      name: 'testError',
      desc: '',
      args: [],
    );
  }

  /// `Test Urgent Error`
  String get testUrgentError {
    return Intl.message(
      'Test Urgent Error',
      name: 'testUrgentError',
      desc: '',
      args: [],
    );
  }

  /// `Remove All SP`
  String get removeSP {
    return Intl.message(
      'Remove All SP',
      name: 'removeSP',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? Log In Now`
  String get loginCTA {
    return Intl.message(
      'Already have an account? Log In Now',
      name: 'loginCTA',
      desc: '',
      args: [],
    );
  }

  /// `Dont have an account yet? Sign Up Now`
  String get signUpCTA {
    return Intl.message(
      'Dont have an account yet? Sign Up Now',
      name: 'signUpCTA',
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
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
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
