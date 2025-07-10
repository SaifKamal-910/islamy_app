import 'package:flutter/material.dart';
import 'package:islami_application/home/home_screen.dart';
import 'package:islami_application/home/tabs/quran/sura_details_screen.dart';
import 'package:islami_application/intro_screen.dart';
import 'package:islami_application/utils/app_theme.dart';

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {HomeScreen.routeName: (context) => HomeScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen()
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark, //
    );
  }
}

void main() {
  runApp(IslamiApp());
}
