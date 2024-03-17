import 'package:flutter/material.dart';

class LocaleManager {
  static Locale getCurrentLocale(BuildContext context) {
    return Localizations.localeOf(context);
  }

  static void setLocale(BuildContext context, Locale locale) {
    // Implement logic to set the locale
    // Example: Locale('fr', 'FR') for French (France)
    // You may use a package like shared_preferences to persist the selected locale
  }
}
