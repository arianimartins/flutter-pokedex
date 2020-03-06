import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() => runApp(MyPokedex());

class MyPokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Pokedéx',
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.redAccent
      ),
      home: SplashScreen(),
    );
  }
}


