import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class RadioDetails extends StatelessWidget {
  final String text;

  const RadioDetails({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      height: height * 0.15,
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.038),
            child: Image.asset(
              'assets/images/radio_name_bg.png',
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: height * 0.02,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.015,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/play_icon.png'),
                SizedBox(width: width * 0.04),
                Image.asset('assets/images/sound_icon.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
