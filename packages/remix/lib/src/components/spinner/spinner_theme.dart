part of 'spinner.dart';

class XSpinnerThemeVariant extends Variant {
  static const soft = XSpinnerThemeVariant('soft');
  static const solid = XSpinnerThemeVariant('solid');

  static const values = [soft, solid];

  const XSpinnerThemeVariant(String value) : super('spinner.$value');
}

class XSpinnerThemeStyle {
  static Style get value => Style(
        XSpinnerStyle.base(),
        XSpinnerThemeVariant.solid($spinner.color.$accent()),
        XSpinnerThemeVariant.soft($spinner.color.$accent(8)),
      );
}
