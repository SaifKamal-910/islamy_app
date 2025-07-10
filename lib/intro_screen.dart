import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = 'intro';

  const IntroScreen({super.key});

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacementNamed('home');
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(assetName, width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0, color: Colors.white);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.zero,
    );

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/Intro Screen (2).png',
            fit: BoxFit.fill,
          ),
        ),
        IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.transparent,
          allowImplicitScrolling: true,
          autoScrollDuration: 3000,
          infiniteAutoScroll: true,
          pages: [
            PageViewModel(
              title: "Fractional shares",
              body:
                  "Instead of having to buy an entire share, invest any amount you want.",
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Learn as you go",
              body:
                  "Download the Stockpile app and master the market with our mini-lesson.",
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Kids and teens",
              body:
                  "Kids and teens can track their stocks 24/7 and place trades that you approve.",
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          onSkip: () => _onIntroEnd(context),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          next: const Icon(Icons.arrow_forward, color: Colors.white),
          done: const Text(
            'Done',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding:
              kIsWeb
                  ? const EdgeInsets.all(12.0)
                  : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeColor: Colors.white,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            color: Colors.black54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
      ],
    );
  }
}
