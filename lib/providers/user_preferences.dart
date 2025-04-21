import 'package:flutter/material.dart';
import 'package:music_app/pages/modals/switch_langugae.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferencesProvider extends ChangeNotifier {
  static const String interfaceLanguageText = "interface_language";
  static const String targetLanguagesText = "target_languages";
  static const String favoriteCategories = "favorite_categories";
  String _interfaceLanguage = "en";
  List<String> _targetLanguages = [];

  UserPreferencesProvider() {
    _loadUserPreference();
  }
  String get interfaceLanguage => _interfaceLanguage;

  List<String> get targetLanguages => _targetLanguages;
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
    _targetLanguages = prefs.getStringList(targetLanguagesText) ?? [];
    notifyListeners();
  }

  Future<void> updateInterfaceLanguage(String newLang) async {
    _interfaceLanguage = newLang;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("interface_language", newLang);
    notifyListeners();
  }

  Future<void> updateTargetLanguages(List<String> newTarget) async {
    _targetLanguages = newTarget;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(targetLanguagesText, newTarget);
    notifyListeners();
  }

  bool isTargetLanguageSelected(String langCode) {
    return _targetLanguages.contains(langCode);
  }

  void toggleTargetLanguage(String langCode) {
    if (_targetLanguages.contains(langCode)) {
      _targetLanguages.remove(langCode);
    } else {
      _targetLanguages.add(langCode);
    }
    updateTargetLanguages(_targetLanguages);
  }
}
