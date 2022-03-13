import '../refs/text_style_ref.dart';

const $h1 = TextStyleRef('h1');
const $h2 = TextStyleRef('h2');
const $h3 = TextStyleRef('h3');
const $h4 = TextStyleRef('h4');
const $h5 = TextStyleRef('h5');
const $h6 = TextStyleRef('h6');
const $subtitle1 = TextStyleRef('subtitle1');
const $subtitle2 = TextStyleRef('subtitle2');
const $body1 = TextStyleRef('body1');
const $body2 = TextStyleRef('body2');
const $caption = TextStyleRef('caption');
const $button = TextStyleRef('button');
const $overline = TextStyleRef('overline');

const $textTheme = _TextThemeTokens();
const $tt = $textTheme;

class _TextThemeTokens {
  const _TextThemeTokens();

  final TextStyleRef h1 = $h1;
  final TextStyleRef h2 = $h2;
  final TextStyleRef h3 = $h3;
  final TextStyleRef h4 = $h4;
  final TextStyleRef h5 = $h5;
  final TextStyleRef h6 = $h6;
  final TextStyleRef subtitle1 = $subtitle1;
  final TextStyleRef subtitle2 = $subtitle2;
  final TextStyleRef body1 = $body1;
  final TextStyleRef body2 = $body2;
  final TextStyleRef caption = $caption;
  final TextStyleRef button = $button;
  final TextStyleRef overline = $overline;
}
