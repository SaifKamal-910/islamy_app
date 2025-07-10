import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/home/tabs/quran/quran_resources.dart';
import 'package:islami_application/utils/app_assets.dart';
import 'package:islami_application/utils/app_colors.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura Details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> versus = [];

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (versus.isEmpty) {
      loadSuraFile(index);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranSuras[index],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            AppAssets.suraDetails,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              const SizedBox(height: 24),
              Center(
                child: Text(
                  QuranResources.arabicQuranSuras[index],
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Expanded(
                child:
                    versus.isEmpty
                        ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                        : ListView.builder(
                          itemCount: versus.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 12,
                              ),
                              child: Text(
                                versus[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          },
                        ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    versus = lines;
    Future.delayed(const Duration(seconds: 1), () => setState(() {}));
  }
}
