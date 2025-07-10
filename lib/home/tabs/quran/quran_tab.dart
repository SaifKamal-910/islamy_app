import 'package:flutter/material.dart';
import 'package:islami_application/home/tabs/quran/sura_details_screen.dart';
import 'package:islami_application/home/tabs/quran/sura_item.dart';
import 'package:islami_application/utils/app_assets.dart';
import 'package:islami_application/utils/app_colors.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: TextStyle(color: AppColors.whiteColor),
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
              ),
              prefixIcon: Image.asset(AppAssets.iconSearch),
              hintText: 'Sura Name',
              hintStyle: TextStyle(color: AppColors.whiteColor),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Most Recently',
            style: TextStyle(color: Color(0xffFEFFE8)),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: height * 0.02),
          SizedBox(
            height: height * 0.15,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 283,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Al-Anbiya',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              // textAlign: TextAlign.center,
                              'الأنبياء',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '112 Verses  ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(AppAssets.mostRecently),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.01);
              },
              itemCount: 10,
            ),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Suras list',
            style: TextStyle(
              color: Color(0xffFEFFE8),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: height * 0.01),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      SuraDetailsScreen.routeName,
                      arguments: filterList[index],
                    );
                  },
                  child: SuraItem(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 2,
                  indent: width * 0.1,
                  endIndent: width * 0.05,
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }
}
