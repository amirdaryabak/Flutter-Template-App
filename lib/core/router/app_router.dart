import 'package:flutter_template_app/core/constants/strings/strings.dart';
import 'package:flutter_template_app/modules/login/choose_server/screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case choose_server:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(Strings.error),
          centerTitle: true,
        ),
        body: Center(
          child: Text(Strings.routNotFound),
        ),
      );
    });
  }

  static const String choose_server = '/choose_server';
}
