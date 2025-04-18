import 'package:flutter/material.dart';
import 'package:music_app/pages/modals/switch_langugae.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferencesProvider extends ChangeNotifier {
  static const String interfaceLanguageText = "interface_language";
  String _interfaceLanguage = "en";
  UserPreferencesProvider() {
    _loadUserPreference();
  }
  String get interfaceLanguage => _interfaceLanguage;
  Map get currentLanguageInfo => SwitchLangugae.supportedLanguages.firstWhere(
    (item) => item['value'] == _interfaceLanguage,
    orElse:
        () => {
          "flag": "assets/images/flags/vietname.png",
          "name": "Vietnamese",
          "value": "vi",
        },
  );

  Future<void> _loadUserPreference() async {
    final prefs = await SharedPreferences.getInstance();
    _interfaceLanguage = prefs.getString(interfaceLanguageText) ?? "en";
    notifyListeners();
  }

  Future<void> updateInterfaceLanguage(String newLang) async {
    _interfaceLanguage = newLang;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("interface_language", newLang);
    notifyListeners();
  }
}
