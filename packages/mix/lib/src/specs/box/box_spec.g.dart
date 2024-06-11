part of 'box_spec.dart';

mixin BoxSpecMixable on Spec<BoxSpec> {
  static BoxSpec from(MixData mix) {
    return mix.attributeOf<BoxSpecAttribute>()?.resolve(mix) ?? const BoxSpec();
  }

  static BoxSpec of(BuildContext context) {
    return BoxSpecMixable.from(Mix.of(context));
  }

  @override
  BoxSpec copyWith({
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxConstraints? constraints,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip? clipBehavior,
    double? width,
    double? height,
    AnimatedData? animated,
  }) {
    return BoxSpec(
      alignment: alignment ?? _$this.alignment,
      padding: padding ?? _$this.padding,
      margin: margin ?? _$this.margin,
      constraints: constraints ?? _$this.constraints,
      decoration: decoration ?? _$this.decoration,
      foregroundDecoration: foregroundDecoration ?? _$this.foregroundDecoration,
      transform: transform ?? _$this.transform,
      transformAlignment: transformAlignment ?? _$this.transformAlignment,
      clipBehavior: clipBehavior ?? _$this.clipBehavior,
      width: width ?? _$this.width,
      height: height ?? _$this.height,
      animated: animated ?? _$this.animated,
    );
  }

  @override
  BoxSpec lerp(
    BoxSpec? other,
    double t,
  ) {
    if (other == null) return _$this;

    return BoxSpec(
      alignment: AlignmentGeometry.lerp(
        _$this.alignment,
        other._$this.alignment,
        t,
      ),
      padding: EdgeInsetsGeometry.lerp(
        _$this.padding,
        other._$this.padding,
        t,
      ),
      margin: EdgeInsetsGeometry.lerp(
        _$this.margin,
        other._$this.margin,
        t,
      ),
      constraints: BoxConstraints.lerp(
        _$this.constraints,
        other._$this.constraints,
        t,
      ),
      decoration: Decoration.lerp(
        _$this.decoration,
        other._$this.decoration,
        t,
      ),
      foregroundDecoration: Decoration.lerp(
        _$this.foregroundDecoration,
        other._$this.foregroundDecoration,
        t,
      ),
      transform: Matrix4Tween(
        begin: _$this.transform,
        end: other._$this.transform,
      ).lerp(t),
      transformAlignment: AlignmentGeometry.lerp(
        _$this.transformAlignment,
        other._$this.transformAlignment,
        t,
      ),
      clipBehavior: t < 0.5 ? _$this.clipBehavior : other._$this.clipBehavior,
      width: _lerpDouble(
        _$this.width,
        other._$this.width,
        t,
      ),
      height: _lerpDouble(
        _$this.height,
        other._$this.height,
        t,
      ),
      animated: t < 0.5 ? _$this.animated : other._$this.animated,
    );
  }

  @override
  List<Object?> get props {
    return [
      _$this.alignment,
      _$this.padding,
      _$this.margin,
      _$this.constraints,
      _$this.decoration,
      _$this.foregroundDecoration,
      _$this.transform,
      _$this.transformAlignment,
      _$this.clipBehavior,
      _$this.width,
      _$this.height,
      _$this.animated,
    ];
  }

  BoxSpec get _$this => this as BoxSpec;
  double? _lerpDouble(
    num? a,
    num? b,
    double t,
  ) {
    if (a == b || (a?.isNaN ?? false) && (b?.isNaN ?? false)) {
      return a?.toDouble();
    }
    a ??= 0.0;
    b ??= 0.0;
    return a * (1.0 - t) + b * t;
  }
}

class BoxSpecAttribute extends SpecAttribute<BoxSpec> {
  const BoxSpecAttribute({
    this.alignment,
    this.padding,
    this.margin,
    this.constraints,
    this.decoration,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.clipBehavior,
    this.width,
    this.height,
    super.animated,
  });

  final AlignmentGeometry? alignment;

  final SpacingDto? padding;

  final SpacingDto? margin;

  final BoxConstraintsDto? constraints;

  final DecorationDto? decoration;

  final DecorationDto? foregroundDecoration;

  final Matrix4? transform;

  final AlignmentGeometry? transformAlignment;

  final Clip? clipBehavior;

  final double? width;

  final double? height;

  @override
  BoxSpec resolve(MixData mix) {
    return BoxSpec(
      alignment: alignment,
      padding: padding?.resolve(mix),
      margin: margin?.resolve(mix),
      constraints: constraints?.resolve(mix),
      decoration: decoration?.resolve(mix),
      foregroundDecoration: foregroundDecoration?.resolve(mix),
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      width: width,
      height: height,
      animated: animated?.resolve(mix),
    );
  }

  @override
  BoxSpecAttribute merge(BoxSpecAttribute? other) {
    if (other == null) return this;

    return BoxSpecAttribute(
      alignment: other.alignment ?? alignment,
      padding: padding?.merge(other.padding) ?? other.padding,
      margin: margin?.merge(other.margin) ?? other.margin,
      constraints: constraints?.merge(other.constraints) ?? other.constraints,
      decoration: decoration?.merge(other.decoration) ?? other.decoration,
      foregroundDecoration:
          foregroundDecoration?.merge(other.foregroundDecoration) ??
              other.foregroundDecoration,
      transform: other.transform ?? transform,
      transformAlignment: other.transformAlignment ?? transformAlignment,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      width: other.width ?? width,
      height: other.height ?? height,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  @override
  List<Object?> get props {
    return [
      alignment,
      padding,
      margin,
      constraints,
      decoration,
      foregroundDecoration,
      transform,
      transformAlignment,
      clipBehavior,
      width,
      height,
      animated,
    ];
  }
}

class BoxSpecUtility<T extends Attribute>
    extends SpecUtility<T, BoxSpecAttribute> {
  BoxSpecUtility(super.builder);

  late final alignment = AlignmentUtility((v) => only(alignment: v));

  late final padding = SpacingUtility((v) => only(padding: v));

  late final margin = SpacingUtility((v) => only(margin: v));

  late final constraints = BoxConstraintsUtility((v) => only(constraints: v));

  late final maxWidth = constraints.maxWidth;

  late final minWidth = constraints.minWidth;

  late final maxHeight = constraints.maxHeight;

  late final minHeight = constraints.minHeight;

  late final decoration = BoxDecorationUtility((v) => only(decoration: v));

  late final shapeDecoration =
      ShapeDecorationUtility((v) => only(decoration: v));

  late final color = decoration.color;

  late final border = decoration.border;

  late final borderRadius = decoration.borderRadius;

  late final gradient = decoration.gradient;

  late final radialGradient = decoration.gradient.radial;

  late final linearGradient = decoration.gradient.linear;

  late final shadows = decoration.boxShadows;

  late final shadow = decoration.boxShadow;

  late final elevation = decoration.elevation;

  late final borderRadiusDirectional = decoration.borderRadiusDirectional;

  late final borderDirectional = decoration.borderDirectional;

  late final foregroundDecoration =
      BoxDecorationUtility((v) => only(foregroundDecoration: v));

  late final transform = Matrix4Utility((v) => only(transform: v));

  late final transformAlignment =
      AlignmentUtility((v) => only(transformAlignment: v));

  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));

  late final width = DoubleUtility((v) => only(width: v));

  late final height = DoubleUtility((v) => only(height: v));

  late final animated = AnimatedUtility((v) => only(animated: v));

  @override
  T only({
    AlignmentGeometry? alignment,
    SpacingDto? padding,
    SpacingDto? margin,
    BoxConstraintsDto? constraints,
    DecorationDto? decoration,
    DecorationDto? foregroundDecoration,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip? clipBehavior,
    double? width,
    double? height,
    AnimatedDataDto? animated,
  }) {
    return builder(
      BoxSpecAttribute(
        alignment: alignment,
        padding: padding,
        margin: margin,
        constraints: constraints,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        transform: transform,
        transformAlignment: transformAlignment,
        clipBehavior: clipBehavior,
        width: width,
        height: height,
        animated: animated,
      ),
    );
  }
}

class BoxSpecTween extends Tween<BoxSpec?> {
  BoxSpecTween({
    super.begin,
    super.end,
  });

  @override
  BoxSpec lerp(double t) {
    if (begin == null && end == null) return const BoxSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
