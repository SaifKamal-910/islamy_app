import 'package:flutter/material.dart';
import 'package:islami_application/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_application/home/tabs/quran/quran_tab.dart';
import 'package:islami_application/home/tabs/radio/radio_tab.dart';
import 'package:islami_application/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_application/home/tabs/time/time_tab.dart';
import 'package:islami_application/utils/app_assets.dart';
import 'package:islami_application/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String>backgroundImage = [
    AppAssets.quranBg,
    AppAssets.hadithBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,

  ];
  List<Widget>tabs = [
    QuranTab(), HadethTab(), SebhaTab(), RadioTab(), TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImage[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        // Expanded(child: tabs[selectedIndex]),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (int index) {
              selectedIndex = index;
              print(selectedIndex);
              setState(() {});
            },

            selectedItemColor: AppColors.whiteColor,
            unselectedItemColor: AppColors.blackColor,
            backgroundColor: AppColors.primaryColor,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: builtBottomNavigationBar(
                    index: 0, imageName: AppAssets.iconQuran),
                label: 'quran',
              ),
              BottomNavigationBarItem(
                icon: builtBottomNavigationBar(
                    index: 1, imageName: AppAssets.iconHadith),
                label: 'Hadith',
              ),
              BottomNavigationBarItem(
                icon: builtBottomNavigationBar(
                    index: 2, imageName: AppAssets.iconSebha),
                label: 'sebha',
              ),
              BottomNavigationBarItem(
                icon: builtBottomNavigationBar(
                    index: 3, imageName: AppAssets.iconRadio),
                label: 'radio',
              ),
              BottomNavigationBarItem(
                icon: builtBottomNavigationBar(
                    index: 4, imageName: AppAssets.iconTime),
                label: 'time',
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo),
              Expanded(child: tabs[selectedIndex])
            ],),
        ),
      ],
    );
  }

  Widget builtBottomNavigationBar(
      {required int index, required String imageName}) {
    return selectedIndex == index ?
    Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: AppColors.blackBgColor,
        ),

        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        child: ImageIcon(AssetImage(imageName))) : ImageIcon(AssetImage(
        imageName));

  }
}
