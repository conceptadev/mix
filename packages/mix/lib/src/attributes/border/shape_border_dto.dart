// ignore_for_file: prefer_relative_imports, avoid-importing-entrypoint-exports
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'shape_border_dto.g.dart';

@immutable
sealed class ShapeBorderMix<T extends ShapeBorder> extends Mixable<T> {
  const ShapeBorderMix();

  static ShapeBorderMix? tryToMerge(ShapeBorderMix? a, ShapeBorderMix? b) {
    if (b == null) return a;
    if (a == null) return b;

    if (b is! OutlinedBorderMix || a is! OutlinedBorderMix) {
      // Not merge anything besides OutlinedBorderDto
      return b;
    }

    return OutlinedBorderMix.tryToMerge(a, b);
  }

  static ({
    BorderSideMix? side,
    BorderRadiusGeometryMix? borderRadius,
    BoxShape? boxShape,
  }) extract(ShapeBorderMix? dto) {
    return dto is OutlinedBorderMix
        ? (
            side: dto.side,
            borderRadius: dto.borderRadiusGetter,
            boxShape: dto._toBoxShape(),
          )
        : (side: null, borderRadius: null, boxShape: null);
  }

  @override
  ShapeBorderMix<T> merge(covariant ShapeBorderMix<T>? other);
}

@immutable
abstract class OutlinedBorderMix<T extends OutlinedBorder>
    extends ShapeBorderMix<T> {
  final BorderSideMix? side;

  const OutlinedBorderMix({this.side});

  static OutlinedBorderMix? tryToMerge(
    OutlinedBorderMix? a,
    OutlinedBorderMix? b,
  ) {
    if (b == null) return a;
    if (a == null) return b;

    return _exhaustiveMerge(a, b);
  }

  static B _exhaustiveMerge<A extends OutlinedBorderMix,
      B extends OutlinedBorderMix>(A a, B b) {
    if (a.runtimeType == b.runtimeType) return a.merge(b) as B;

    final adaptedA = b.adapt(a) as B;

    return adaptedA.merge(b) as B;
  }

  BoxShape? _toBoxShape() {
    if (this is CircleBorderMix) {
      return BoxShape.circle;
    } else if (this is RoundedRectangleBorderMix) {
      return BoxShape.rectangle;
    }

    return null;
  }

  @protected
  BorderRadiusGeometryMix? get borderRadiusGetter;

  OutlinedBorderMix<T> adapt(OutlinedBorderMix other);

  @override
  OutlinedBorderMix<T> merge(covariant OutlinedBorderMix<T>? other);
}

@MixableProperty()
final class RoundedRectangleBorderMix
    extends OutlinedBorderMix<RoundedRectangleBorder>
    with _$RoundedRectangleBorderMix {
  @MixableField(dto: MixableFieldProperty(type: BorderRadiusGeometryMix))
  final BorderRadiusGeometryMix? borderRadius;

  const RoundedRectangleBorderMix({this.borderRadius, super.side});

  @override
  RoundedRectangleBorderMix adapt(OutlinedBorderMix other) {
    if (other is RoundedRectangleBorderMix) return other;

    return RoundedRectangleBorderMix(
      borderRadius: other.borderRadiusGetter,
      side: other.side,
    );
  }

  @override
  BorderRadiusGeometryMix? get borderRadiusGetter => borderRadius;
}

@MixableProperty()
final class BeveledRectangleBorderMix
    extends OutlinedBorderMix<BeveledRectangleBorder>
    with _$BeveledRectangleBorderMix {
  final BorderRadiusGeometryMix? borderRadius;

  const BeveledRectangleBorderMix({this.borderRadius, super.side});

  @override
  BeveledRectangleBorderMix adapt(OutlinedBorderMix other) {
    if (other is BeveledRectangleBorderMix) return other;

    return BeveledRectangleBorderMix(
      borderRadius: other.borderRadiusGetter,
      side: other.side,
    );
  }

  @override
  BorderRadiusGeometryMix? get borderRadiusGetter => borderRadius;
}

@MixableProperty()
final class ContinuousRectangleBorderMix
    extends OutlinedBorderMix<ContinuousRectangleBorder>
    with _$ContinuousRectangleBorderMix {
  final BorderRadiusGeometryMix? borderRadius;

  const ContinuousRectangleBorderMix({this.borderRadius, super.side});

  @override
  ContinuousRectangleBorderMix adapt(OutlinedBorderMix other) {
    if (other is ContinuousRectangleBorderMix) {
      return other;
    }

    return ContinuousRectangleBorderMix(
      borderRadius: other.borderRadiusGetter,
      side: other.side,
    );
  }

  @override
  BorderRadiusGeometryMix? get borderRadiusGetter => borderRadius;
}

@MixableProperty()
final class CircleBorderMix extends OutlinedBorderMix<CircleBorder>
    with _$CircleBorderMix {
  final double? eccentricity;

  const CircleBorderMix({super.side, this.eccentricity});

  @override
  CircleBorderMix adapt(OutlinedBorderMix other) {
    if (other is CircleBorderMix) {
      return other;
    }

    return CircleBorderMix(side: other.side);
  }

  @override
  BorderRadiusGeometryMix? get borderRadiusGetter => null;
}

@MixableProperty()
final class StarBorderMix extends OutlinedBorderMix<StarBorder>
    with _$StarBorderMix {
  final double? points;
  final double? innerRadiusRatio;
  final double? pointRounding;
  final double? valleyRounding;
  final double? rotation;
  final double? squash;

  const StarBorderMix({
    super.side,
    this.points,
    this.innerRadiusRatio,
    this.pointRounding,
    this.valleyRounding,
    this.rotation,
    this.squash,
  });

  @override
  StarBorderMix adapt(OutlinedBorderMix other) {
    return StarBorderMix(side: other.side);
  }

  @override
  BorderRadiusGeometryMix? get borderRadiusGetter => null;
}

@MixableProperty()
final class LinearBorderMix extends OutlinedBorderMix<LinearBorder>
    with _$LinearBorderMix {
  final LinearBorderEdgeMix? start;
  final LinearBorderEdgeMix? end;
  final LinearBorderEdgeMix? top;
  final LinearBorderEdgeMix? bottom;

  const LinearBorderMix({
    super.side,
    this.start,
    this.end,
    this.top,
    this.bottom,
  });

  @override
  LinearBorderMix adapt(OutlinedBorderMix other) {
    if (other is LinearBorderMix) {
      return other;
    }

    return LinearBorderMix(side: other.side);
  }

  @override
  BorderRadiusGeometryMix? get borderRadiusGetter => null;
}

@MixableProperty()
final class LinearBorderEdgeMix extends Mixable<LinearBorderEdge>
    with _$LinearBorderEdgeMix {
  final double? size;
  final double? alignment;

  const LinearBorderEdgeMix({this.size, this.alignment});
}

@MixableProperty()
final class StadiumBorderMix extends OutlinedBorderMix<StadiumBorder>
    with _$StadiumBorderMix {
  const StadiumBorderMix({super.side});

  @override
  StadiumBorderMix adapt(OutlinedBorderMix other) {
    if (other is StadiumBorderMix) {
      return other;
    }

    return StadiumBorderMix(side: other.side);
  }

  @override
  BorderRadiusGeometryMix? get borderRadiusGetter => null;
}

abstract class MixOutlinedBorder<T extends OutlinedBorderMix>
    extends OutlinedBorder {
  const MixOutlinedBorder({super.side = BorderSide.none});
  T toDto();
}

extension ShapeBorderExt on ShapeBorder {
  ShapeBorderMix toDto() {
    final self = this;
    if (self is BeveledRectangleBorder) return (self).toDto();
    if (self is CircleBorder) return (self).toDto();
    if (self is ContinuousRectangleBorder) return (self).toDto();
    if (self is LinearBorder) return (self).toDto();
    if (self is RoundedRectangleBorder) return (self).toDto();
    if (self is StadiumBorder) return (self).toDto();
    if (self is StarBorder) return (self).toDto();
    if (self is MixOutlinedBorder) return (self).toDto();

    throw FlutterError.fromParts([
      ErrorSummary('Unsupported ShapeBorder type.'),
      ErrorDescription(
        'If you are trying to create a custom ShapeBorder, it must extend MixOutlinedBorder. '
        'Otherwise, use a built-in Mix shape such as BeveledRectangleBorder, CircleBorder, '
        'ContinuousRectangleBorder, LinearBorder, RoundedRectangleBorder, StadiumBorder, or StarBorder.',
      ),
      ErrorHint(
        'Custom ShapeBorders that do not extend MixOutlinedBorder will not work with Mix.',
      ),
      DiagnosticsProperty<ShapeBorder>('The unsupported ShapeBorder was', this),
    ]);
  }
}

class ShapeBorderMixUtility<T extends Attribute>
    extends MixUtility<T, ShapeBorderMix> {
  late final beveledRectangle = BeveledRectangleBorderUtility(builder);

  late final circle = CircleBorderUtility(builder);

  late final continuousRectangle = ContinuousRectangleBorderUtility(builder);

  late final linear = LinearBorderUtility(builder);

  late final roundedRectangle = RoundedRectangleBorderMixUtility(builder);

  late final stadium = StadiumBorderUtility(builder);

  late final star = StarBorderUtility(builder);

  late final shapeBuilder = builder;

  ShapeBorderMixUtility(super.builder);
}
