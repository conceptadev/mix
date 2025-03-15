// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scalar_util.dart';

// **************************************************************************
// MixableUtilityGenerator
// **************************************************************************

/// {@template alignment_utility}
/// A utility class for creating [Attribute] instances from [AlignmentGeometry] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [AlignmentGeometry] values.
/// {@endtemplate}
mixin _$AlignmentUtility<T extends Attribute>
    on MixUtility<T, AlignmentGeometry> {
  /// Creates an [Attribute] instance with [Alignment.topLeft] value.
  T topLeft() => builder(Alignment.topLeft);

  /// Creates an [Attribute] instance with [Alignment.topCenter] value.
  T topCenter() => builder(Alignment.topCenter);

  /// Creates an [Attribute] instance with [Alignment.topRight] value.
  T topRight() => builder(Alignment.topRight);

  /// Creates an [Attribute] instance with [Alignment.centerLeft] value.
  T centerLeft() => builder(Alignment.centerLeft);

  /// Creates an [Attribute] instance with [Alignment.center] value.
  T center() => builder(Alignment.center);

  /// Creates an [Attribute] instance with [Alignment.centerRight] value.
  T centerRight() => builder(Alignment.centerRight);

  /// Creates an [Attribute] instance with [Alignment.bottomLeft] value.
  T bottomLeft() => builder(Alignment.bottomLeft);

  /// Creates an [Attribute] instance with [Alignment.bottomCenter] value.
  T bottomCenter() => builder(Alignment.bottomCenter);

  /// Creates an [Attribute] instance with [Alignment.bottomRight] value.
  T bottomRight() => builder(Alignment.bottomRight);

  /// Creates an [Attribute] instance with the specified AlignmentGeometry value.
  T call(AlignmentGeometry value) => builder(value);
}

/// {@template alignment_directional_utility}
/// A utility class for creating [Attribute] instances from [AlignmentDirectional] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [AlignmentDirectional] values.
/// {@endtemplate}
mixin _$AlignmentDirectionalUtility<T extends Attribute>
    on MixUtility<T, AlignmentDirectional> {
  /// Creates an [Attribute] instance with [AlignmentDirectional.topStart] value.
  T topStart() => builder(AlignmentDirectional.topStart);

  /// Creates an [Attribute] instance with [AlignmentDirectional.topCenter] value.
  T topCenter() => builder(AlignmentDirectional.topCenter);

  /// Creates an [Attribute] instance with [AlignmentDirectional.topEnd] value.
  T topEnd() => builder(AlignmentDirectional.topEnd);

  /// Creates an [Attribute] instance with [AlignmentDirectional.centerStart] value.
  T centerStart() => builder(AlignmentDirectional.centerStart);

  /// Creates an [Attribute] instance with [AlignmentDirectional.center] value.
  T center() => builder(AlignmentDirectional.center);

  /// Creates an [Attribute] instance with [AlignmentDirectional.centerEnd] value.
  T centerEnd() => builder(AlignmentDirectional.centerEnd);

  /// Creates an [Attribute] instance with [AlignmentDirectional.bottomStart] value.
  T bottomStart() => builder(AlignmentDirectional.bottomStart);

  /// Creates an [Attribute] instance with [AlignmentDirectional.bottomCenter] value.
  T bottomCenter() => builder(AlignmentDirectional.bottomCenter);

  /// Creates an [Attribute] instance with [AlignmentDirectional.bottomEnd] value.
  T bottomEnd() => builder(AlignmentDirectional.bottomEnd);

  /// Creates an [Attribute] instance with the specified AlignmentDirectional value.
  T call(AlignmentDirectional value) => builder(value);
}

/// {@template font_feature_utility}
/// A utility class for creating [Attribute] instances from [FontFeature] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [FontFeature] values.
/// {@endtemplate}
mixin _$FontFeatureUtility<T extends Attribute> on MixUtility<T, FontFeature> {
  /// Creates an [Attribute] instance using the [FontFeature.enable] constructor.
  T enable(String feature) => builder(FontFeature.enable(feature));

  /// Creates an [Attribute] instance using the [FontFeature.disable] constructor.
  T disable(String feature) => builder(FontFeature.disable(feature));

  /// Creates an [Attribute] instance using the [FontFeature.alternative] constructor.
  T alternative(int value) => builder(FontFeature.alternative(value));

  /// Creates an [Attribute] instance using the [FontFeature.alternativeFractions] constructor.
  T alternativeFractions() => builder(const FontFeature.alternativeFractions());

  /// Creates an [Attribute] instance using the [FontFeature.contextualAlternates] constructor.
  T contextualAlternates() => builder(const FontFeature.contextualAlternates());

  /// Creates an [Attribute] instance using the [FontFeature.caseSensitiveForms] constructor.
  T caseSensitiveForms() => builder(const FontFeature.caseSensitiveForms());

  /// Creates an [Attribute] instance using the [FontFeature.characterVariant] constructor.
  T characterVariant(int value) => builder(FontFeature.characterVariant(value));

  /// Creates an [Attribute] instance using the [FontFeature.denominator] constructor.
  T denominator() => builder(const FontFeature.denominator());

  /// Creates an [Attribute] instance using the [FontFeature.fractions] constructor.
  T fractions() => builder(const FontFeature.fractions());

  /// Creates an [Attribute] instance using the [FontFeature.historicalForms] constructor.
  T historicalForms() => builder(const FontFeature.historicalForms());

  /// Creates an [Attribute] instance using the [FontFeature.historicalLigatures] constructor.
  T historicalLigatures() => builder(const FontFeature.historicalLigatures());

  /// Creates an [Attribute] instance using the [FontFeature.liningFigures] constructor.
  T liningFigures() => builder(const FontFeature.liningFigures());

  /// Creates an [Attribute] instance using the [FontFeature.localeAware] constructor.
  T localeAware({bool enable = true}) {
    return builder(FontFeature.localeAware(enable: enable));
  }

  /// Creates an [Attribute] instance using the [FontFeature.notationalForms] constructor.
  T notationalForms([int value = 1]) =>
      builder(FontFeature.notationalForms(value));

  /// Creates an [Attribute] instance using the [FontFeature.numerators] constructor.
  T numerators() => builder(const FontFeature.numerators());

  /// Creates an [Attribute] instance using the [FontFeature.oldstyleFigures] constructor.
  T oldstyleFigures() => builder(const FontFeature.oldstyleFigures());

  /// Creates an [Attribute] instance using the [FontFeature.ordinalForms] constructor.
  T ordinalForms() => builder(const FontFeature.ordinalForms());

  /// Creates an [Attribute] instance using the [FontFeature.proportionalFigures] constructor.
  T proportionalFigures() => builder(const FontFeature.proportionalFigures());

  /// Creates an [Attribute] instance using the [FontFeature.randomize] constructor.
  T randomize() => builder(const FontFeature.randomize());

  /// Creates an [Attribute] instance using the [FontFeature.stylisticAlternates] constructor.
  T stylisticAlternates() => builder(const FontFeature.stylisticAlternates());

  /// Creates an [Attribute] instance using the [FontFeature.scientificInferiors] constructor.
  T scientificInferiors() => builder(const FontFeature.scientificInferiors());

  /// Creates an [Attribute] instance using the [FontFeature.stylisticSet] constructor.
  T stylisticSet(int value) => builder(FontFeature.stylisticSet(value));

  /// Creates an [Attribute] instance using the [FontFeature.subscripts] constructor.
  T subscripts() => builder(const FontFeature.subscripts());

  /// Creates an [Attribute] instance using the [FontFeature.superscripts] constructor.
  T superscripts() => builder(const FontFeature.superscripts());

  /// Creates an [Attribute] instance using the [FontFeature.swash] constructor.
  T swash([int value = 1]) => builder(FontFeature.swash(value));

  /// Creates an [Attribute] instance using the [FontFeature.tabularFigures] constructor.
  T tabularFigures() => builder(const FontFeature.tabularFigures());

  /// Creates an [Attribute] instance using the [FontFeature.slashedZero] constructor.
  T slashedZero() => builder(const FontFeature.slashedZero());

  /// Creates an [Attribute] instance with the specified FontFeature value.
  T call(FontFeature value) => builder(value);
}

/// {@template duration_utility}
/// A utility class for creating [Attribute] instances from [Duration] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [Duration] values.
/// {@endtemplate}
mixin _$DurationUtility<T extends Attribute> on MixUtility<T, Duration> {
  /// Creates an [Attribute] instance with [Duration.zero] value.
  T zero() => builder(Duration.zero);

  /// Creates an [Attribute] instance with the specified Duration value.
  T call(Duration value) => builder(value);
}

/// {@template font_weight_utility}
/// A utility class for creating [Attribute] instances from [FontWeight] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [FontWeight] values.
/// {@endtemplate}
mixin _$FontWeightUtility<T extends Attribute> on MixUtility<T, FontWeight> {
  /// Creates an [Attribute] instance with [FontWeight.w100] value.
  T w100() => builder(FontWeight.w100);

  /// Creates an [Attribute] instance with [FontWeight.w200] value.
  T w200() => builder(FontWeight.w200);

  /// Creates an [Attribute] instance with [FontWeight.w300] value.
  T w300() => builder(FontWeight.w300);

  /// Creates an [Attribute] instance with [FontWeight.w400] value.
  T w400() => builder(FontWeight.w400);

  /// Creates an [Attribute] instance with [FontWeight.w500] value.
  T w500() => builder(FontWeight.w500);

  /// Creates an [Attribute] instance with [FontWeight.w600] value.
  T w600() => builder(FontWeight.w600);

  /// Creates an [Attribute] instance with [FontWeight.w700] value.
  T w700() => builder(FontWeight.w700);

  /// Creates an [Attribute] instance with [FontWeight.w800] value.
  T w800() => builder(FontWeight.w800);

  /// Creates an [Attribute] instance with [FontWeight.w900] value.
  T w900() => builder(FontWeight.w900);

  /// Creates an [Attribute] instance with [FontWeight.normal] value.
  T normal() => builder(FontWeight.normal);

  /// Creates an [Attribute] instance with [FontWeight.bold] value.
  T bold() => builder(FontWeight.bold);

  /// Creates an [Attribute] instance with the specified FontWeight value.
  T call(FontWeight value) => builder(value);
}

/// {@template text_decoration_utility}
/// A utility class for creating [Attribute] instances from [TextDecoration] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [TextDecoration] values.
/// {@endtemplate}
mixin _$TextDecorationUtility<T extends Attribute>
    on MixUtility<T, TextDecoration> {
  /// Creates an [Attribute] instance with [TextDecoration.none] value.
  T none() => builder(TextDecoration.none);

  /// Creates an [Attribute] instance with [TextDecoration.underline] value.
  T underline() => builder(TextDecoration.underline);

  /// Creates an [Attribute] instance with [TextDecoration.overline] value.
  T overline() => builder(TextDecoration.overline);

  /// Creates an [Attribute] instance with [TextDecoration.lineThrough] value.
  T lineThrough() => builder(TextDecoration.lineThrough);

  /// Creates an [Attribute] instance using the [TextDecoration.combine] constructor.
  T combine(List<TextDecoration> decorations) {
    return builder(TextDecoration.combine(decorations));
  }

  /// Creates an [Attribute] instance with the specified TextDecoration value.
  T call(TextDecoration value) => builder(value);
}

/// {@template curve_utility}
/// A utility class for creating [Attribute] instances from [Curve] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [Curve] values.
/// {@endtemplate}
mixin _$CurveUtility<T extends Attribute> on MixUtility<T, Curve> {
  /// Creates an [Attribute] instance with [Curves.linear] value.
  T linear() => builder(Curves.linear);

  /// Creates an [Attribute] instance with [Curves.decelerate] value.
  T decelerate() => builder(Curves.decelerate);

  /// Creates an [Attribute] instance with [Curves.fastLinearToSlowEaseIn] value.
  T fastLinearToSlowEaseIn() => builder(Curves.fastLinearToSlowEaseIn);

  /// Creates an [Attribute] instance with [Curves.fastEaseInToSlowEaseOut] value.
  T fastEaseInToSlowEaseOut() => builder(Curves.fastEaseInToSlowEaseOut);

  /// Creates an [Attribute] instance with [Curves.ease] value.
  T ease() => builder(Curves.ease);

  /// Creates an [Attribute] instance with [Curves.easeIn] value.
  T easeIn() => builder(Curves.easeIn);

  /// Creates an [Attribute] instance with [Curves.easeInToLinear] value.
  T easeInToLinear() => builder(Curves.easeInToLinear);

  /// Creates an [Attribute] instance with [Curves.easeInSine] value.
  T easeInSine() => builder(Curves.easeInSine);

  /// Creates an [Attribute] instance with [Curves.easeInQuad] value.
  T easeInQuad() => builder(Curves.easeInQuad);

  /// Creates an [Attribute] instance with [Curves.easeInCubic] value.
  T easeInCubic() => builder(Curves.easeInCubic);

  /// Creates an [Attribute] instance with [Curves.easeInQuart] value.
  T easeInQuart() => builder(Curves.easeInQuart);

  /// Creates an [Attribute] instance with [Curves.easeInQuint] value.
  T easeInQuint() => builder(Curves.easeInQuint);

  /// Creates an [Attribute] instance with [Curves.easeInExpo] value.
  T easeInExpo() => builder(Curves.easeInExpo);

  /// Creates an [Attribute] instance with [Curves.easeInCirc] value.
  T easeInCirc() => builder(Curves.easeInCirc);

  /// Creates an [Attribute] instance with [Curves.easeInBack] value.
  T easeInBack() => builder(Curves.easeInBack);

  /// Creates an [Attribute] instance with [Curves.easeOut] value.
  T easeOut() => builder(Curves.easeOut);

  /// Creates an [Attribute] instance with [Curves.linearToEaseOut] value.
  T linearToEaseOut() => builder(Curves.linearToEaseOut);

  /// Creates an [Attribute] instance with [Curves.easeOutSine] value.
  T easeOutSine() => builder(Curves.easeOutSine);

  /// Creates an [Attribute] instance with [Curves.easeOutQuad] value.
  T easeOutQuad() => builder(Curves.easeOutQuad);

  /// Creates an [Attribute] instance with [Curves.easeOutCubic] value.
  T easeOutCubic() => builder(Curves.easeOutCubic);

  /// Creates an [Attribute] instance with [Curves.easeOutQuart] value.
  T easeOutQuart() => builder(Curves.easeOutQuart);

  /// Creates an [Attribute] instance with [Curves.easeOutQuint] value.
  T easeOutQuint() => builder(Curves.easeOutQuint);

  /// Creates an [Attribute] instance with [Curves.easeOutExpo] value.
  T easeOutExpo() => builder(Curves.easeOutExpo);

  /// Creates an [Attribute] instance with [Curves.easeOutCirc] value.
  T easeOutCirc() => builder(Curves.easeOutCirc);

  /// Creates an [Attribute] instance with [Curves.easeOutBack] value.
  T easeOutBack() => builder(Curves.easeOutBack);

  /// Creates an [Attribute] instance with [Curves.easeInOut] value.
  T easeInOut() => builder(Curves.easeInOut);

  /// Creates an [Attribute] instance with [Curves.easeInOutSine] value.
  T easeInOutSine() => builder(Curves.easeInOutSine);

  /// Creates an [Attribute] instance with [Curves.easeInOutQuad] value.
  T easeInOutQuad() => builder(Curves.easeInOutQuad);

  /// Creates an [Attribute] instance with [Curves.easeInOutCubic] value.
  T easeInOutCubic() => builder(Curves.easeInOutCubic);

  /// Creates an [Attribute] instance with [Curves.easeInOutCubicEmphasized] value.
  T easeInOutCubicEmphasized() => builder(Curves.easeInOutCubicEmphasized);

  /// Creates an [Attribute] instance with [Curves.easeInOutQuart] value.
  T easeInOutQuart() => builder(Curves.easeInOutQuart);

  /// Creates an [Attribute] instance with [Curves.easeInOutQuint] value.
  T easeInOutQuint() => builder(Curves.easeInOutQuint);

  /// Creates an [Attribute] instance with [Curves.easeInOutExpo] value.
  T easeInOutExpo() => builder(Curves.easeInOutExpo);

  /// Creates an [Attribute] instance with [Curves.easeInOutCirc] value.
  T easeInOutCirc() => builder(Curves.easeInOutCirc);

  /// Creates an [Attribute] instance with [Curves.easeInOutBack] value.
  T easeInOutBack() => builder(Curves.easeInOutBack);

  /// Creates an [Attribute] instance with [Curves.fastOutSlowIn] value.
  T fastOutSlowIn() => builder(Curves.fastOutSlowIn);

  /// Creates an [Attribute] instance with [Curves.slowMiddle] value.
  T slowMiddle() => builder(Curves.slowMiddle);

  /// Creates an [Attribute] instance with [Curves.bounceIn] value.
  T bounceIn() => builder(Curves.bounceIn);

  /// Creates an [Attribute] instance with [Curves.bounceOut] value.
  T bounceOut() => builder(Curves.bounceOut);

  /// Creates an [Attribute] instance with [Curves.bounceInOut] value.
  T bounceInOut() => builder(Curves.bounceInOut);

  /// Creates an [Attribute] instance with [Curves.elasticIn] value.
  T elasticIn() => builder(Curves.elasticIn);

  /// Creates an [Attribute] instance with [Curves.elasticOut] value.
  T elasticOut() => builder(Curves.elasticOut);

  /// Creates an [Attribute] instance with [Curves.elasticInOut] value.
  T elasticInOut() => builder(Curves.elasticInOut);

  /// Creates an [Attribute] instance with the specified Curve value.
  T call(Curve value) => builder(value);
}

/// {@template offset_utility}
/// A utility class for creating [Attribute] instances from [Offset] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [Offset] values.
/// {@endtemplate}
mixin _$OffsetUtility<T extends Attribute> on MixUtility<T, Offset> {
  /// Creates an [Attribute] instance with [Offset.zero] value.
  T zero() => builder(Offset.zero);

  /// Creates an [Attribute] instance with [Offset.infinite] value.
  T infinite() => builder(Offset.infinite);

  /// Creates an [Attribute] instance using the [Offset] constructor.
  T call(double dx, double dy) => builder(Offset(dx, dy));

  /// Creates an [Attribute] instance using the [Offset.fromDirection] constructor.
  T fromDirection(double direction, [double distance = 1.0]) {
    return builder(Offset.fromDirection(direction, distance));
  }
}

/// {@template radius_utility}
/// A utility class for creating [Attribute] instances from [Radius] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [Radius] values.
/// {@endtemplate}
mixin _$RadiusUtility<T extends Attribute> on MixUtility<T, Radius> {
  /// Creates an [Attribute] instance with [Radius.zero] value.
  T zero() => builder(Radius.zero);

  /// Creates an [Attribute] instance using the [Radius.circular] constructor.
  T circular(double radius) => builder(Radius.circular(radius));

  /// Creates an [Attribute] instance using the [Radius.elliptical] constructor.
  T elliptical(double x, double y) => builder(Radius.elliptical(x, y));
}

/// {@template rect_utility}
/// A utility class for creating [Attribute] instances from [Rect] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [Rect] values.
/// {@endtemplate}
mixin _$RectUtility<T extends Attribute> on MixUtility<T, Rect> {
  /// Creates an [Attribute] instance with [Rect.zero] value.
  T zero() => builder(Rect.zero);

  /// Creates an [Attribute] instance with [Rect.largest] value.
  T largest() => builder(Rect.largest);

  /// Creates an [Attribute] instance using the [Rect.fromLTRB] constructor.
  T fromLTRB(double left, double top, double right, double bottom) {
    return builder(Rect.fromLTRB(left, top, right, bottom));
  }

  /// Creates an [Attribute] instance using the [Rect.fromLTWH] constructor.
  T fromLTWH(double left, double top, double width, double height) {
    return builder(Rect.fromLTWH(left, top, width, height));
  }

  /// Creates an [Attribute] instance using the [Rect.fromCircle] constructor.
  T fromCircle({required Offset center, required double radius}) {
    return builder(Rect.fromCircle(center: center, radius: radius));
  }

  /// Creates an [Attribute] instance using the [Rect.fromCenter] constructor.
  T fromCenter(
      {required Offset center, required double width, required double height}) {
    return builder(
        Rect.fromCenter(center: center, width: width, height: height));
  }

  /// Creates an [Attribute] instance using the [Rect.fromPoints] constructor.
  T fromPoints(Offset a, Offset b) => builder(Rect.fromPoints(a, b));

  /// Creates an [Attribute] instance with the specified Rect value.
  T call(Rect value) => builder(value);
}

/// {@template image_provider_utility}
/// A utility class for creating [Attribute] instances from [ImageProvider] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [ImageProvider] values.
/// {@endtemplate}
mixin _$ImageProviderUtility<T extends Attribute>
    on MixUtility<T, ImageProvider> {
  /// Creates an [Attribute] instance with the specified ImageProvider value.
  T call(ImageProvider value) => builder(value);
}

/// {@template gradient_transform_utility}
/// A utility class for creating [Attribute] instances from [GradientTransform] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [GradientTransform] values.
/// {@endtemplate}
mixin _$GradientTransformUtility<T extends Attribute>
    on MixUtility<T, GradientTransform> {
  /// Creates an [Attribute] instance with the specified GradientTransform value.
  T call(GradientTransform value) => builder(value);
}

/// {@template matrix4_utility}
/// A utility class for creating [Attribute] instances from [Matrix4] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [Matrix4] values.
/// {@endtemplate}
mixin _$Matrix4Utility<T extends Attribute> on MixUtility<T, Matrix4> {
  /// Creates an [Attribute] instance using the [Matrix4.fromList] constructor.
  T fromList(List<double> values) => builder(Matrix4.fromList(values));

  /// Creates an [Attribute] instance using the [Matrix4.zero] constructor.
  T zero() => builder(Matrix4.zero());

  /// Creates an [Attribute] instance using the [Matrix4.identity] constructor.
  T identity() => builder(Matrix4.identity());

  /// Creates an [Attribute] instance using the [Matrix4.rotationX] constructor.
  T rotationX(double radians) => builder(Matrix4.rotationX(radians));

  /// Creates an [Attribute] instance using the [Matrix4.rotationY] constructor.
  T rotationY(double radians) => builder(Matrix4.rotationY(radians));

  /// Creates an [Attribute] instance using the [Matrix4.rotationZ] constructor.
  T rotationZ(double radians) => builder(Matrix4.rotationZ(radians));

  /// Creates an [Attribute] instance using the [Matrix4.translationValues] constructor.
  T translationValues(double x, double y, double z) {
    return builder(Matrix4.translationValues(x, y, z));
  }

  /// Creates an [Attribute] instance using the [Matrix4.diagonal3Values] constructor.
  T diagonal3Values(double x, double y, double z) {
    return builder(Matrix4.diagonal3Values(x, y, z));
  }

  /// Creates an [Attribute] instance using the [Matrix4.skewX] constructor.
  T skewX(double alpha) => builder(Matrix4.skewX(alpha));

  /// Creates an [Attribute] instance using the [Matrix4.skewY] constructor.
  T skewY(double beta) => builder(Matrix4.skewY(beta));

  /// Creates an [Attribute] instance using the [Matrix4.skew] constructor.
  T skew(double alpha, double beta) => builder(Matrix4.skew(alpha, beta));

  /// Creates an [Attribute] instance using the [Matrix4.fromBuffer] constructor.
  T fromBuffer(ByteBuffer buffer, int offset) {
    return builder(Matrix4.fromBuffer(buffer, offset));
  }

  /// Creates an [Attribute] instance with the specified Matrix4 value.
  T call(Matrix4 value) => builder(value);
}

/// {@template font_family_utility}
/// A utility class for creating [Attribute] instances from [String] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [String] values.
/// {@endtemplate}
mixin _$FontFamilyUtility<T extends Attribute> on MixUtility<T, String> {
  /// Creates an [Attribute] instance using the [String.fromCharCodes] constructor.
  T fromCharCodes(Iterable<int> charCodes, [int start = 0, int? end]) {
    return builder(String.fromCharCodes(charCodes, start, end));
  }

  /// Creates an [Attribute] instance using the [String.fromCharCode] constructor.
  T fromCharCode(int charCode) => builder(String.fromCharCode(charCode));

  /// Creates an [Attribute] instance using the [String.fromEnvironment] constructor.
  T fromEnvironment(String name, {String defaultValue = ""}) {
    return builder(String.fromEnvironment(name, defaultValue: defaultValue));
  }

  /// Creates an [Attribute] instance with the specified String value.
  T call(String value) => builder(value);
}

/// {@template text_scaler_utility}
/// A utility class for creating [Attribute] instances from [TextScaler] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [TextScaler] values.
/// {@endtemplate}
mixin _$TextScalerUtility<T extends Attribute> on MixUtility<T, TextScaler> {
  /// Creates an [Attribute] instance with [TextScaler.noScaling] value.
  T noScaling() => builder(TextScaler.noScaling);

  /// Creates an [Attribute] instance using the [TextScaler.linear] constructor.
  T linear(double textScaleFactor) =>
      builder(TextScaler.linear(textScaleFactor));

  /// Creates an [Attribute] instance with the specified TextScaler value.
  T call(TextScaler value) => builder(value);
}

/// {@template table_column_width_utility}
/// A utility class for creating [Attribute] instances from [TableColumnWidth] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [TableColumnWidth] values.
/// {@endtemplate}
mixin _$TableColumnWidthUtility<T extends Attribute>
    on MixUtility<T, TableColumnWidth> {
  /// Creates an [Attribute] instance with the specified TableColumnWidth value.
  T call(TableColumnWidth value) => builder(value);
}

/// {@template table_border_utility}
/// A utility class for creating [Attribute] instances from [TableBorder] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [TableBorder] values.
/// {@endtemplate}
mixin _$TableBorderUtility<T extends Attribute> on MixUtility<T, TableBorder> {
  /// Creates an [Attribute] instance using the [TableBorder.all] constructor.
  T all(
      {Color color = const Color(0xFF000000),
      double width = 1.0,
      BorderStyle style = BorderStyle.solid,
      BorderRadius borderRadius = BorderRadius.zero}) {
    return builder(TableBorder.all(
        color: color, width: width, style: style, borderRadius: borderRadius));
  }

  /// Creates an [Attribute] instance using the [TableBorder.symmetric] constructor.
  T symmetric(
      {BorderSide inside = BorderSide.none,
      BorderSide outside = BorderSide.none}) {
    return builder(TableBorder.symmetric(inside: inside, outside: outside));
  }

  /// Creates an [Attribute] instance with the specified TableBorder value.
  T call(TableBorder value) => builder(value);
}
