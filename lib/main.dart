import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/assets.dart';
import 'core/constants/strings/strings.dart';
import 'core/theme/app_theme.dart';

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(fontFamily: Assets.Fonts)
      ),
      darkTheme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: "",
    );
  }
}