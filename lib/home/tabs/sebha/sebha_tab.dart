import 'package:flutter/material.dart';
import 'package:islami_application/utils/app_assets.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int currentIndex = 0;

  final List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
  ];

  void incrementCounter() {
    setState(() {
      counter++;
      if (counter % 33 == 0) {
        currentIndex = (currentIndex + 1) % azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: incrementCounter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: height*0.1),
            Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.01),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AppAssets.sebhaBody, width: width * 0.88),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      azkar[currentIndex],
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '$counter',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
