import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class LocaleUtility {
  const LocaleUtility();
  LocaleAttribute call(String languageCode, [String? countryCode]) {
    return LocaleAttribute(Locale(languageCode, countryCode));
  }
}

class LocaleAttribute extends TextMixAttribute<Locale> {
  const LocaleAttribute(this.locale);

  final Locale locale;
  @override
  Locale get value => locale;
}
