part of 'remix_theme.dart';

class RemixTypography {
  RemixTypography();

  TextStyleToken call(int level) {
    return switch (level) {
      1 => text1,
      2 => text2,
      3 => text3,
      4 => text4,
      5 => text5,
      6 => text6,
      7 => text7,
      8 => text8,
      9 => text9,
      _ => throw ArgumentError('Invalid text level: $level'),
    };
  }

  final text1 = const TextStyleToken('--text-1');
  final text2 = const TextStyleToken('--text-2');
  final text3 = const TextStyleToken('--text-3');
  final text4 = const TextStyleToken('--text-4');
  final text5 = const TextStyleToken('--text-5');
  final text6 = const TextStyleToken('--text-6');
  final text7 = const TextStyleToken('--text-7');
  final text8 = const TextStyleToken('--text-8');
  final text9 = const TextStyleToken('--text-9');
}

final _t = RemixTypography();
final remixTextTokens = <TextStyleToken, TextStyle>{
  _t.text1: const TextStyle(
    fontSize: 12,
    letterSpacing: 0.0025,
    height: 1.33,
  ),
  _t.text2: const TextStyle(
    fontSize: 14,
    letterSpacing: 0,
    height: 1.43,
  ),
  _t.text3: const TextStyle(
    fontSize: 16,
    letterSpacing: 0,
    height: 1.50,
  ),
  _t.text4: const TextStyle(
    fontSize: 18,
    letterSpacing: -0.0025,
    height: 1.44,
  ),
  _t.text5: const TextStyle(
    fontSize: 20,
    letterSpacing: -0.005,
    height: 1.40,
  ),
  _t.text6: const TextStyle(
    fontSize: 24,
    letterSpacing: -0.00625,
    height: 1.25,
  ),
  _t.text7: const TextStyle(
    fontSize: 28,
    letterSpacing: -0.0075,
    height: 1.29,
  ),
  _t.text8: const TextStyle(
    fontSize: 35,
    letterSpacing: -0.01,
    height: 1.14,
  ),
  _t.text9: const TextStyle(
    fontSize: 60,
    letterSpacing: -0.025,
    height: 1.00,
  ),
};
