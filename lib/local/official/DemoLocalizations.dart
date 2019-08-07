import 'package:flutter/material.dart';
import 'locale/locale_en.dart';
import 'locale/locale_zh.dart';
import 'locale/locale_base.dart';

class DemoLocalizations {

  final Locale locale;

  DemoLocalizations(this.locale);

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, StringBase> _localizedValues = {
    'en' : StringEn(),
    'zh' : StringZh()
  };

  StringBase get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

}