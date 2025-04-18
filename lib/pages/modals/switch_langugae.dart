import 'package:flutter/material.dart';
import 'package:music_app/providers/user_preferences.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';
import 'package:provider/provider.dart';

class SwitchLangugae extends StatelessWidget {
  const SwitchLangugae({super.key});

  static const List<Map<String, String>> supportedLanguages = [
    {
      "flag": "assets/images/flags/vietname.png",
      "name": "Vietnamese",
      'value': "vi",
    },
    {
      "flag": "assets/images/flags/american.png",
      "name": "English",
      'value': "en",
    },
    {
      "flag": "assets/images/flags/south_korea.webp",
      "name": "Korean",
      'value': "ko",
    },
    {
      "flag": "assets/images/flags/japan.png",
      "name": "Japanese",
      'value': "ja",
    },
    {"flag": "assets/images/flags/china.png", "name": "Chinese", 'value': "zh"},
    {"flag": "assets/images/flags/spain.png", "name": "Spanish", 'value': "es"},
    {
      "flag": "assets/images/flags/portugal.png",
      "name": "Portuguese",
      'value': "pt",
    },
    {"flag": "assets/images/flags/france.png", "name": "French", 'value': "fr"},
  ];

  @override
  Widget build(BuildContext context) {
    final userPrefrence = Provider.of<UserPreferencesProvider>(context);
    final interfaceLanguage = userPrefrence.interfaceLanguage;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Select interface language:",
                      style: AppTextTheme.lightTextTheme.titleLarge,
                    ),
                  ),
                  Icon(Icons.close, size: 32),
                ],
              ),
              SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: supportedLanguages.length,
                  separatorBuilder: (_, _) => SizedBox(height: 12),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _buildLanguageItem(
                      supportedLanguages[index],
                      interfaceLanguage,
                      context,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildLanguageItem(
  Map<String, String> json,
  String interfaceLanguage,
  BuildContext context,
) {
  final userPrefrence = Provider.of<UserPreferencesProvider>(context);

  final colorBorderActive =
      json['value'] == interfaceLanguage ? AppColors.border : AppColors.divider;
  final colorTextActive =
      json['value'] == interfaceLanguage
          ? AppColors.border
          : AppColors.textSecondary;
  return GestureDetector(
    onTap: () {
      userPrefrence.updateInterfaceLanguage(json['value']!);
      Navigator.pop(context);
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: colorBorderActive),
          left: BorderSide(width: 1, color: colorBorderActive),
          bottom: BorderSide(width: 2.5, color: colorBorderActive),
          right: BorderSide(width: 2.5, color: colorBorderActive),
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        spacing: 24,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(json['flag'] ?? ""),
          ),
          Text(
            json['name'] ?? "",
            style: AppTextTheme.lightTextTheme.titleMedium!.copyWith(
              color: colorTextActive,
            ),
          ),
        ],
      ),
    ),
  );
}
