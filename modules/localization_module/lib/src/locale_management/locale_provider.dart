import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  Locale _currentLocale = const Locale('en', 'US');

  Locale get currentLocale => _currentLocale;

  Future<void> setLocale(Locale locale) async {
    _currentLocale = locale;
    notifyListeners();

    // Persist selected locale
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.toString());
  }

  Future<void> loadSavedLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var savedLocale = prefs.getString('locale');

    if (savedLocale != null) {
      _currentLocale = Locale(savedLocale.split('_')[0], savedLocale.split('_')[1]);
      notifyListeners();
    }
  }
}
