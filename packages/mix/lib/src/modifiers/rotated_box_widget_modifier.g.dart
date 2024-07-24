// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rotated_box_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$RotatedBoxModifierSpec on WidgetModifierSpec<RotatedBoxModifierSpec> {
  static RotatedBoxModifierSpec from(MixData mix) {
    return mix.attributeOf<RotatedBoxModifierSpecAttribute>()?.resolve(mix) ??
        const RotatedBoxModifierSpec();
  }

  /// {@template rotated_box_modifier_spec_of}
  /// Retrieves the [RotatedBoxModifierSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [RotatedBoxModifierSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [RotatedBoxModifierSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final rotatedBoxModifierSpec = RotatedBoxModifierSpec.of(context);
  /// ```
  /// {@endtemplate}
  static RotatedBoxModifierSpec of(BuildContext context) {
    return _$RotatedBoxModifierSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [RotatedBoxModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  RotatedBoxModifierSpec copyWith({
    int? quarterTurns,
  }) {
    return RotatedBoxModifierSpec(
      quarterTurns ?? _$this.quarterTurns,
    );
  }

  /// The list of properties that constitute the state of this [RotatedBoxModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [RotatedBoxModifierSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.quarterTurns,
      ];

  RotatedBoxModifierSpec get _$this => this as RotatedBoxModifierSpec;
}

/// Represents the attributes of a [RotatedBoxModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [RotatedBoxModifierSpec].
///
/// Use this class to configure the attributes of a [RotatedBoxModifierSpec] and pass it to
/// the [RotatedBoxModifierSpec] constructor.
final class RotatedBoxModifierSpecAttribute
    extends WidgetModifierSpecAttribute<RotatedBoxModifierSpec>
    with Diagnosticable {
  final int? quarterTurns;

  const RotatedBoxModifierSpecAttribute({
    this.quarterTurns,
  });

  /// Resolves to [RotatedBoxModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final rotatedBoxModifierSpec = RotatedBoxModifierSpecAttribute(...).resolve(mix);
  /// ```
  @override
  RotatedBoxModifierSpec resolve(MixData mix) {
    return RotatedBoxModifierSpec(
      quarterTurns,
    );
  }

  /// Merges the properties of this [RotatedBoxModifierSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [RotatedBoxModifierSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  RotatedBoxModifierSpecAttribute merge(
      RotatedBoxModifierSpecAttribute? other) {
    if (other == null) return this;

    return RotatedBoxModifierSpecAttribute(
      quarterTurns: other.quarterTurns ?? quarterTurns,
    );
  }

  /// The list of properties that constitute the state of this [RotatedBoxModifierSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [RotatedBoxModifierSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        quarterTurns,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('quarterTurns', quarterTurns));
  }
}

/// A tween that interpolates between two [RotatedBoxModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [RotatedBoxModifierSpec] specifications.
class RotatedBoxModifierSpecTween extends Tween<RotatedBoxModifierSpec?> {
  RotatedBoxModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  RotatedBoxModifierSpec lerp(double t) {
    if (begin == null && end == null) return const RotatedBoxModifierSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
