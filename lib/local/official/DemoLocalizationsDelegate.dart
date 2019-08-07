import 'package:flutter_app/local/official/DemoLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {

  const DemoLocalizationsDelegate();

  static LocalizationsDelegate delegate = const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) {
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;

}