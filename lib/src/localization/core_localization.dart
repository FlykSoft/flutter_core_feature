import 'package:intl/intl.dart';

import 'core_arabic_localization_delegate.dart';
import 'core_english_localization_delegate.dart';
import 'core_localization_delegate.dart';

class CoreLocalization {
  static final Map<String, CoreLocalizationDelegate> _registeredLocalizations =
      {
    'en': const CoreEnglishLocalizationDelegate(),
    'ar': const CoreArabicLocalizationDelegate(),
  };

  static void register(Map<String, CoreLocalizationDelegate> localization) {
    _registeredLocalizations.addAll(localization);
  }

  static CoreLocalizationDelegate get instance {
    final String languageCode = Intl.defaultLocale ?? 'en';
    return _registeredLocalizations[languageCode] ??
        const CoreEnglishLocalizationDelegate();
  }
}
