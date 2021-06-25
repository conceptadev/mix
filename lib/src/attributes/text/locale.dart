import 'package:flutter/material.dart';

import '../base_attribute.dart';

class LocaleUtility {
  LocaleAttribute call(String languageCode, [String? countryCode]) {
    return LocaleAttribute(Locale(languageCode, countryCode));
  }
}

class LocaleAttribute extends TextTypeAttribute<Locale> {
  LocaleAttribute(this.locale);

  final Locale locale;

  Locale get value => locale;
}
