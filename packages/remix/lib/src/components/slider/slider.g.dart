// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

mixin _$SliderSpec on Spec<SliderSpec> {
  static SliderSpec from(MixData mix) {
    return mix.attributeOf<SliderSpecAttribute>()?.resolve(mix) ?? SliderSpec();
  }

  /// {@template slider_spec_of}
  /// Retrieves the [SliderSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [SliderSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [SliderSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final sliderSpec = SliderSpec.of(context);
  /// ```
  /// {@endtemplate}
  static SliderSpec of(BuildContext context) {
    return _$SliderSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [SliderSpec] but with the given fields
  /// replaced with the new values.
  @override
  SliderSpec copyWith({
    Color? thumbColor,
    Color? thumbStrokeColor,
    Color? trackColor,
    Color? activeTrackColor,
    double? trackHeight,
    double? thumbRadius,
    double? thumbStrokeWidth,
    EdgeInsetsGeometry? padding,
    Color? divisionColor,
    double? divisionRadius,
    WidgetModifiersData? modifiers,
    AnimatedData? animated,
  }) {
    return SliderSpec(
      thumbColor: thumbColor ?? _$this.thumbColor,
      thumbStrokeColor: thumbStrokeColor ?? _$this.thumbStrokeColor,
      trackColor: trackColor ?? _$this.trackColor,
      activeTrackColor: activeTrackColor ?? _$this.activeTrackColor,
      trackHeight: trackHeight ?? _$this.trackHeight,
      thumbRadius: thumbRadius ?? _$this.thumbRadius,
      thumbStrokeWidth: thumbStrokeWidth ?? _$this.thumbStrokeWidth,
      padding: padding ?? _$this.padding,
      divisionColor: divisionColor ?? _$this.divisionColor,
      divisionRadius: divisionRadius ?? _$this.divisionRadius,
      modifiers: modifiers ?? _$this.modifiers,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [SliderSpec] and another [SliderSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [SliderSpec] is returned. When [t] is 1.0, the [other] [SliderSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [SliderSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [SliderSpec] instance.
  ///
  /// The interpolation is performed on each property of the [SliderSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [Color.lerp] for [thumbColor] and [thumbStrokeColor] and [trackColor] and [activeTrackColor] and [divisionColor].
  /// - [MixHelpers.lerpDouble] for [trackHeight] and [thumbRadius] and [thumbStrokeWidth] and [divisionRadius].
  /// - [EdgeInsetsGeometry.lerp] for [padding].

  /// For [modifiers] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [SliderSpec] is used. Otherwise, the value
  /// from the [other] [SliderSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [SliderSpec] configurations.
  @override
  SliderSpec lerp(SliderSpec? other, double t) {
    if (other == null) return _$this;

    return SliderSpec(
      thumbColor: Color.lerp(_$this.thumbColor, other.thumbColor, t)!,
      thumbStrokeColor:
          Color.lerp(_$this.thumbStrokeColor, other.thumbStrokeColor, t)!,
      trackColor: Color.lerp(_$this.trackColor, other.trackColor, t)!,
      activeTrackColor:
          Color.lerp(_$this.activeTrackColor, other.activeTrackColor, t)!,
      trackHeight:
          MixHelpers.lerpDouble(_$this.trackHeight, other.trackHeight, t)!,
      thumbRadius:
          MixHelpers.lerpDouble(_$this.thumbRadius, other.thumbRadius, t)!,
      thumbStrokeWidth: MixHelpers.lerpDouble(
          _$this.thumbStrokeWidth, other.thumbStrokeWidth, t)!,
      padding: EdgeInsetsGeometry.lerp(_$this.padding, other.padding, t)!,
      divisionColor: Color.lerp(_$this.divisionColor, other.divisionColor, t)!,
      divisionRadius: MixHelpers.lerpDouble(
          _$this.divisionRadius, other.divisionRadius, t)!,
      modifiers: other.modifiers,
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [SliderSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SliderSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.thumbColor,
        _$this.thumbStrokeColor,
        _$this.trackColor,
        _$this.activeTrackColor,
        _$this.trackHeight,
        _$this.thumbRadius,
        _$this.thumbStrokeWidth,
        _$this.padding,
        _$this.divisionColor,
        _$this.divisionRadius,
        _$this.modifiers,
        _$this.animated,
      ];

  SliderSpec get _$this => this as SliderSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(DiagnosticsProperty('thumbColor', _$this.thumbColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty(
        'thumbStrokeColor', _$this.thumbStrokeColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty('trackColor', _$this.trackColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty(
        'activeTrackColor', _$this.activeTrackColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty('trackHeight', _$this.trackHeight,
        defaultValue: null));
    properties.add(DiagnosticsProperty('thumbRadius', _$this.thumbRadius,
        defaultValue: null));
    properties.add(DiagnosticsProperty(
        'thumbStrokeWidth', _$this.thumbStrokeWidth,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty('padding', _$this.padding, defaultValue: null));
    properties.add(DiagnosticsProperty('divisionColor', _$this.divisionColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty('divisionRadius', _$this.divisionRadius,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty('modifiers', _$this.modifiers, defaultValue: null));
    properties.add(
        DiagnosticsProperty('animated', _$this.animated, defaultValue: null));
  }
}

/// Represents the attributes of a [SliderSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [SliderSpec].
///
/// Use this class to configure the attributes of a [SliderSpec] and pass it to
/// the [SliderSpec] constructor.
class SliderSpecAttribute extends SpecAttribute<SliderSpec>
    with Diagnosticable {
  final ColorDto? thumbColor;
  final ColorDto? thumbStrokeColor;
  final ColorDto? trackColor;
  final ColorDto? activeTrackColor;
  final double? trackHeight;
  final double? thumbRadius;
  final double? thumbStrokeWidth;
  final SpacingDto? padding;
  final ColorDto? divisionColor;
  final double? divisionRadius;

  const SliderSpecAttribute({
    this.thumbColor,
    this.thumbStrokeColor,
    this.trackColor,
    this.activeTrackColor,
    this.trackHeight,
    this.thumbRadius,
    this.thumbStrokeWidth,
    this.padding,
    this.divisionColor,
    this.divisionRadius,
    super.modifiers,
    super.animated,
  });

  /// Resolves to [SliderSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final sliderSpec = SliderSpecAttribute(...).resolve(mix);
  /// ```
  @override
  SliderSpec resolve(MixData mix) {
    return SliderSpec(
      thumbColor: thumbColor?.resolve(mix),
      thumbStrokeColor: thumbStrokeColor?.resolve(mix),
      trackColor: trackColor?.resolve(mix),
      activeTrackColor: activeTrackColor?.resolve(mix),
      trackHeight: trackHeight,
      thumbRadius: thumbRadius,
      thumbStrokeWidth: thumbStrokeWidth,
      padding: padding?.resolve(mix),
      divisionColor: divisionColor?.resolve(mix),
      divisionRadius: divisionRadius,
      modifiers: modifiers?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [SliderSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [SliderSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  SliderSpecAttribute merge(covariant SliderSpecAttribute? other) {
    if (other == null) return this;

    return SliderSpecAttribute(
      thumbColor: thumbColor?.merge(other.thumbColor) ?? other.thumbColor,
      thumbStrokeColor: thumbStrokeColor?.merge(other.thumbStrokeColor) ??
          other.thumbStrokeColor,
      trackColor: trackColor?.merge(other.trackColor) ?? other.trackColor,
      activeTrackColor: activeTrackColor?.merge(other.activeTrackColor) ??
          other.activeTrackColor,
      trackHeight: other.trackHeight ?? trackHeight,
      thumbRadius: other.thumbRadius ?? thumbRadius,
      thumbStrokeWidth: other.thumbStrokeWidth ?? thumbStrokeWidth,
      padding: padding?.merge(other.padding) ?? other.padding,
      divisionColor:
          divisionColor?.merge(other.divisionColor) ?? other.divisionColor,
      divisionRadius: other.divisionRadius ?? divisionRadius,
      modifiers: modifiers?.merge(other.modifiers) ?? other.modifiers,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [SliderSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SliderSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        thumbColor,
        thumbStrokeColor,
        trackColor,
        activeTrackColor,
        trackHeight,
        thumbRadius,
        thumbStrokeWidth,
        padding,
        divisionColor,
        divisionRadius,
        modifiers,
        animated,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('thumbColor', thumbColor, defaultValue: null));
    properties.add(DiagnosticsProperty('thumbStrokeColor', thumbStrokeColor,
        defaultValue: null));
    properties
        .add(DiagnosticsProperty('trackColor', trackColor, defaultValue: null));
    properties.add(DiagnosticsProperty('activeTrackColor', activeTrackColor,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty('trackHeight', trackHeight, defaultValue: null));
    properties.add(
        DiagnosticsProperty('thumbRadius', thumbRadius, defaultValue: null));
    properties.add(DiagnosticsProperty('thumbStrokeWidth', thumbStrokeWidth,
        defaultValue: null));
    properties.add(DiagnosticsProperty('padding', padding, defaultValue: null));
    properties.add(DiagnosticsProperty('divisionColor', divisionColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty('divisionRadius', divisionRadius,
        defaultValue: null));
    properties
        .add(DiagnosticsProperty('modifiers', modifiers, defaultValue: null));
    properties
        .add(DiagnosticsProperty('animated', animated, defaultValue: null));
  }
}

/// Utility class for configuring [SliderSpec] properties.
///
/// This class provides methods to set individual properties of a [SliderSpec].
/// Use the methods of this class to configure specific properties of a [SliderSpec].
class SliderSpecUtility<T extends Attribute>
    extends SpecUtility<T, SliderSpecAttribute> {
  /// Utility for defining [SliderSpecAttribute.thumbColor]
  late final thumbColor = ColorUtility((v) => only(thumbColor: v));

  /// Utility for defining [SliderSpecAttribute.thumbStrokeColor]
  late final thumbStrokeColor = ColorUtility((v) => only(thumbStrokeColor: v));

  /// Utility for defining [SliderSpecAttribute.trackColor]
  late final trackColor = ColorUtility((v) => only(trackColor: v));

  /// Utility for defining [SliderSpecAttribute.activeTrackColor]
  late final activeTrackColor = ColorUtility((v) => only(activeTrackColor: v));

  /// Utility for defining [SliderSpecAttribute.trackHeight]
  late final trackHeight = DoubleUtility((v) => only(trackHeight: v));

  /// Utility for defining [SliderSpecAttribute.thumbRadius]
  late final thumbRadius = DoubleUtility((v) => only(thumbRadius: v));

  /// Utility for defining [SliderSpecAttribute.thumbStrokeWidth]
  late final thumbStrokeWidth = DoubleUtility((v) => only(thumbStrokeWidth: v));

  /// Utility for defining [SliderSpecAttribute.padding]
  late final padding = SpacingUtility((v) => only(padding: v));

  /// Utility for defining [SliderSpecAttribute.divisionColor]
  late final divisionColor = ColorUtility((v) => only(divisionColor: v));

  /// Utility for defining [SliderSpecAttribute.divisionRadius]
  late final divisionRadius = DoubleUtility((v) => only(divisionRadius: v));

  /// Utility for defining [SliderSpecAttribute.modifiers]
  late final wrap = SpecModifierUtility((v) => only(modifiers: v));

  /// Utility for defining [SliderSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  SliderSpecUtility(super.builder, {super.mutable});

  SliderSpecUtility<T> get chain =>
      SliderSpecUtility(attributeBuilder, mutable: true);

  static SliderSpecUtility<SliderSpecAttribute> get self =>
      SliderSpecUtility((v) => v);

  /// Returns a new [SliderSpecAttribute] with the specified properties.
  @override
  T only({
    ColorDto? thumbColor,
    ColorDto? thumbStrokeColor,
    ColorDto? trackColor,
    ColorDto? activeTrackColor,
    double? trackHeight,
    double? thumbRadius,
    double? thumbStrokeWidth,
    SpacingDto? padding,
    ColorDto? divisionColor,
    double? divisionRadius,
    WidgetModifiersDataDto? modifiers,
    AnimatedDataDto? animated,
  }) {
    return builder(SliderSpecAttribute(
      thumbColor: thumbColor,
      thumbStrokeColor: thumbStrokeColor,
      trackColor: trackColor,
      activeTrackColor: activeTrackColor,
      trackHeight: trackHeight,
      thumbRadius: thumbRadius,
      thumbStrokeWidth: thumbStrokeWidth,
      padding: padding,
      divisionColor: divisionColor,
      divisionRadius: divisionRadius,
      modifiers: modifiers,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [SliderSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [SliderSpec] specifications.
class SliderSpecTween extends Tween<SliderSpec?> {
  SliderSpecTween({
    super.begin,
    super.end,
  });

  @override
  SliderSpec lerp(double t) {
    if (begin == null && end == null) {
      return SliderSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
