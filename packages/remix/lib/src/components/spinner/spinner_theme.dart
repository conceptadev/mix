part of 'spinner.dart';

class FortalezaSpinnerStyle extends SpinnerStyle {
  static const solid = Variant('for.spinner.solid');
  static const soft = Variant('for.spinner.soft');

  const FortalezaSpinnerStyle();

  static List<Variant> get variants => [solid, soft];

  @override
  Style makeStyle(SpecConfiguration<SpinnerSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);

    final solidVariant = Style($.color.$accent());
    final softVariant = Style($.color.$accent(8));

    return Style.create(
      [baseStyle(), solid(solidVariant()), soft(softVariant())],
    );
  }
}
