import 'package:flutter/material.dart';
import 'package:islami_application/home/tabs/radio/radio_details.dart';
import 'package:islami_application/utils/app_colors.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List<String> radioList = [
      'Radio Ibrahim Al-Akdar',
      'Radio Al-Qaria Yassen',
      'Radio Ahmed Al-trabulsi',
    ];

    List<String> reciterList = [
      'Akram Alalaqmi',
      'Majed Al-Enezi',
      'Malik shaibat Alhamed',
    ];

    List<String> currentList = selectedIndex == 0 ? radioList : reciterList;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Container(
                    height: height * 0.04,
                    decoration: BoxDecoration(
                      color:
                          selectedIndex == 0
                              ? AppColors.primaryColor
                              : AppColors.blackColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Radio',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * 0.01),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                    height: height * 0.04,
                    decoration: BoxDecoration(
                      color:
                          selectedIndex == 1
                              ? AppColors.primaryColor
                              : AppColors.blackColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Reciters',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        RadioDetails(text: currentList[0]),
        SizedBox(height: height * 0.01),
        RadioDetails(text: currentList[1]),
        SizedBox(height: height * 0.01),
        RadioDetails(text: currentList[2]),
        SizedBox(height: height * 0.01),
      ],
    );
  }
}
