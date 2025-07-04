import 'package:flutter/material.dart';
import 'package:islami_application/home/home_screen.dart';

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {HomeScreen.routeName: (context) => HomeScreen()},
    );
  }
}

void main() {
  runApp(IslamiApp());
}
