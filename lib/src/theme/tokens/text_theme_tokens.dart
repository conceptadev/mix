import '../refs/text_style_ref.dart';

const $headline1 = TextStyleRef('headline1');
const $headline2 = TextStyleRef('headline2');
const $headline3 = TextStyleRef('headline3');
const $headline4 = TextStyleRef('headline4');
const $headline5 = TextStyleRef('headline5');
const $headline6 = TextStyleRef('headline6');
const $subtitle1 = TextStyleRef('subtitle1');
const $subtitle2 = TextStyleRef('subtitle2');
const $body1 = TextStyleRef('body1');
const $body2 = TextStyleRef('body2');
const $caption = TextStyleRef('caption');
const $button = TextStyleRef('button');
const $overline = TextStyleRef('overline');

const $textTheme = _TextThemeTokens();

class _TextThemeTokens {
  const _TextThemeTokens();

  final TextStyleRef headline1 = $headline1;
  final TextStyleRef headline2 = $headline2;
  final TextStyleRef headline3 = $headline3;
  final TextStyleRef headline4 = $headline4;
  final TextStyleRef headline5 = $headline5;
  final TextStyleRef headline6 = $headline6;
  final TextStyleRef subtitle1 = $subtitle1;
  final TextStyleRef subtitle2 = $subtitle2;
  final TextStyleRef body1 = $body1;
  final TextStyleRef body2 = $body2;
  final TextStyleRef caption = $caption;
  final TextStyleRef button = $button;
  final TextStyleRef overline = $overline;
}
