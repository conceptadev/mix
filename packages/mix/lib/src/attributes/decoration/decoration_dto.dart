// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../internal/diagnostic_properties_builder_ext.dart';
import '../../internal/mix_error.dart';

part 'decoration_dto.g.dart';

typedef _BaseDecorProperties = ({
  ColorDto? color,
  GradientDto? gradient,
  List<BoxShadowMix>? boxShadow,
  DecorationImageMix? image,
});

/// A Data transfer object that represents a [Decoration] value.
///
/// This DTO is used to resolve a [Decoration] value from a [MixData] instance.
///
/// This class needs to have the different properties that are not found in the [Modifiers] class.
/// In order to support merging of [Decoration] values, and reusable of common properties.
@immutable
sealed class DecorationMix<T extends Decoration> extends Mixable<T>
    with Diagnosticable {
  final ColorDto? color;
  final GradientDto? gradient;
  final DecorationImageMix? image;
  @MixableField(
    utilities: [
      MixableFieldUtility(
        alias: 'boxShadows',
        properties: [(path: 'add', alias: 'boxShadow')],
      ),
      MixableFieldUtility(alias: 'elevation', type: 'ElevationUtility'),
    ],
  )
  final List<BoxShadowMix>? boxShadow;

  const DecorationMix({
    required this.color,
    required this.gradient,
    required this.boxShadow,
    required this.image,
  });

  static DecorationMix? tryToMerge(DecorationMix? a, DecorationMix? b) {
    if (b == null) return a;
    if (a == null) return b;

    if (a.runtimeType == b.runtimeType) {
      return a.merge(b);
    }

    if (b.isMergeable) {
      return a.mergeableDecor(b);
    }

    if (b is BoxDecorationMix) {
      return _toBoxDecorationDto(a as ShapeDecorationMix).merge(b);
    }

    if (b is ShapeDecorationMix) {
      return _toShapeDecorationDto(a as BoxDecorationMix).merge(b);
    }

    throw UnimplementedError('Merging of $a and $b is not supported.');
  }

  _BaseDecorProperties _getBaseDecor() {
    return (
      color: color,
      gradient: gradient,
      boxShadow: boxShadow,
      image: image,
    );
  }

  bool get isMergeable;

  DecorationMix? mergeableDecor(covariant DecorationMix? other);

  @override
  DecorationMix<T> merge(covariant DecorationMix<T>? other);
}

/// Represents a Data transfer object of [BoxDecoration]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[BoxDecoration]
@MixableProperty()
final class BoxDecorationMix extends DecorationMix<BoxDecoration>
    with _$BoxDecorationMix {
  @MixableField(
    utilities: [
      MixableFieldUtility(
        properties: [(path: 'directional', alias: 'borderDirectional')],
      ),
    ],
  )
  final BoxBorderMix? border;

  @MixableField(
    utilities: [
      MixableFieldUtility(
        properties: [(path: 'directional', alias: 'borderRadiusDirectional')],
      ),
    ],
  )
  final BorderRadiusGeometryMix? borderRadius;
  final BoxShape? shape;
  final BlendMode? backgroundBlendMode;

  const BoxDecorationMix({
    this.border,
    this.borderRadius,
    this.shape,
    this.backgroundBlendMode,
    super.color,
    super.image,
    super.gradient,
    super.boxShadow,
  });
  @override
  BoxDecorationMix mergeableDecor(ShapeDecorationMix? other) {
    if (other == null) return this;

    final (:boxShadow, :color, :gradient, :image) = other._getBaseDecor();

    final (:borderRadius, :boxShape, :side) =
        ShapeBorderMix.extract(other.shape);

    return merge(
      BoxDecorationMix(
        border: side != null ? BorderMix.all(side) : null,
        borderRadius: borderRadius,
        shape: boxShape,
        color: color,
        image: image,
        gradient: gradient,
        boxShadow: boxShadow,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.whitespace
      ..emptyBodyDescription = '<no decorations specified>';

    properties.addUsingDefault('image', image);
    properties.addUsingDefault('color', color);
    properties.addUsingDefault('border', border);
    properties.addUsingDefault('borderRadius', borderRadius);
    properties.addUsingDefault('gradient', gradient);
    properties.add(IterableProperty<BoxShadowMix>(
      'boxShadow',
      boxShadow,
      defaultValue: null,
    ));
    properties.add(EnumProperty<BoxShape>(
      'shape',
      shape,
      defaultValue: null,
    ));
  }

  @override
  bool get isMergeable => backgroundBlendMode == null;
}

@MixableProperty()
final class ShapeDecorationMix extends DecorationMix<ShapeDecoration>
    with HasDefaultValue<ShapeDecoration>, _$ShapeDecorationMix {
  final ShapeBorderMix? shape;

  const ShapeDecorationMix({
    this.shape,
    super.color,
    super.image,
    super.gradient,
    List<BoxShadowMix>? shadows,
  }) : super(boxShadow: shadows);

  List<BoxShadowMix>? get shadows => boxShadow;
  @override
  ShapeDecorationMix mergeableDecor(BoxDecorationMix? other) {
    if (other == null) return this;

    assert(
      other.border == null || other.border!.isUniform,
      'Border to use with ShapeDecoration must be uniform.',
    );

    final (:boxShadow, :color, :gradient, :image) = other._getBaseDecor();

    final shapeBorder = _fromBoxShape(
      shape: other.shape,
      side: other.border?.top,
      borderRadius: other.borderRadius,
    );

    return merge(
      ShapeDecorationMix(
        shape: shapeBorder,
        color: color,
        image: image,
        gradient: gradient,
        shadows: boxShadow,
      ),
    );
  }

  @override
  bool get isMergeable => (shape == null ||
      (shape is CircleBorderMix &&
          ((shape as CircleBorderMix).eccentricity == null)) ||
      shape is RoundedRectangleBorderMix);

  @override
  ShapeDecoration get defaultValue =>
      const ShapeDecoration(shape: RoundedRectangleBorder());
}

/// Converts a [ShapeDecorationMix] to a [BoxDecorationMix].
BoxDecorationMix _toBoxDecorationDto(ShapeDecorationMix dto) {
  final (:boxShadow, :color, :gradient, :image) = dto._getBaseDecor();
  final (:borderRadius, :boxShape, :side) = ShapeBorderMix.extract(dto.shape);

  return BoxDecorationMix(
    border: side != null ? BorderMix.all(side) : null,
    borderRadius: borderRadius,
    shape: boxShape,
    color: color,
    image: image,
    gradient: gradient,
    boxShadow: boxShadow,
  );
}

ShapeDecorationMix _toShapeDecorationDto(BoxDecorationMix dto) {
  final (:boxShadow, :color, :gradient, :image) = dto._getBaseDecor();
  final shapeBorder = _fromBoxShape(
    shape: dto.shape,
    side: dto.border?.top,
    borderRadius: dto.borderRadius,
  );

  return ShapeDecorationMix(
    shape: shapeBorder,
    color: color,
    image: image,
    gradient: gradient,
    shadows: boxShadow,
  );
}

extension DecorationMixExt on Decoration {
  DecorationMix toDto() {
    final self = this;
    if (self is BoxDecoration) return self.toDto();
    if (self is ShapeDecoration) return self.toDto();

    throw MixError.unsupportedTypeInDto(
      Decoration,
      ['BoxDecoration', 'ShapeDecoration'],
    );
  }
}

ShapeBorderMix? _fromBoxShape({
  required BoxShape? shape,
  required BorderSideMix? side,
  required BorderRadiusGeometryMix? borderRadius,
}) {
  switch (shape) {
    case BoxShape.circle:
      return CircleBorderMix(side: side);
    case BoxShape.rectangle:
      return RoundedRectangleBorderMix(borderRadius: borderRadius, side: side);
    default:
      if (side != null || borderRadius != null) {
        return RoundedRectangleBorderMix(
          borderRadius: borderRadius,
          side: side,
        );
      }

      return null;
  }
}

class DecorationMixUtility<T extends Attribute>
    extends MixUtility<T, DecorationMix> {
  const DecorationMixUtility(super.builder);

  BoxDecorationMixUtility<T> get box => BoxDecorationMixUtility(builder);

  ShapeDecorationUtility<T> get shape => ShapeDecorationUtility(builder);
}
