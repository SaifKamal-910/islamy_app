import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_application/utils/app_colors.dart';

import '../home/home_screen.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = 'intro';

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  Widget _buildImage(String assetName) {
    return Image.asset(assetName, fit: BoxFit.contain);
  }

  @override
  Widget build(BuildContext context) {
    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
      bodyTextStyle: TextStyle(fontSize: 20.0, color: AppColors.primaryColor),
      imagePadding: EdgeInsets.only(top: 60),
      contentMargin: EdgeInsets.symmetric(horizontal: 24),
      pageColor: Colors.transparent,
    );

    return Stack(
      children: [
        Image.asset(
          'assets/images/intro_screen_Bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.transparent,
          pages: [
            PageViewModel(
              title: "Welcome to Islami",
              body: "We Are Very Excited To Have You In Our Community",
              image: _buildImage('assets/images/photo_1_intro.png'),
              decoration: pageDecoration,
            ),

            PageViewModel(
              title: "Reading the Quran",
              body: "Read, and your Lord is the Most Generous",
              image: _buildImage('assets/images/photo_2_intro.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Bearish",
              body: "Praise the name of your Lord, the Most High",
              image: _buildImage('assets/images/photo_3_intro.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Holy Quran Radio",
              body:
                  "You can listen to the Holy Quran Radio through the application for free and easily",
              image: _buildImage('assets/images/photo_4_intro.png'),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          showBackButton: true,
          back: Text('Back', style: TextStyle(color: AppColors.primaryColor)),
          next: Text('Next', style: TextStyle(color: AppColors.primaryColor)),
          done: Text('Finish', style: TextStyle(color: AppColors.primaryColor)),
          dotsDecorator: DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xff707070),
            activeSize: Size(22.0, 10.0),
            activeColor: AppColors.primaryColor,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          curve: Curves.fastLinearToSlowEaseIn,
        ),
      ],
    );
  }
}
