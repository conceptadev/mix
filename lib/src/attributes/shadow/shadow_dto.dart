import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../color/color_dto.dart';

@immutable
abstract class ShadowDtoImpl<Self extends ShadowDtoImpl<Self, Value>,
    Value extends Shadow> extends Dto<Value> with Mergeable<Self> {
  final ColorDto? color;
  final Offset? offset;
  final double? blurRadius;

  const ShadowDtoImpl({this.blurRadius, this.color, this.offset});

  @override
  Value resolve(MixData mix);

  @override
  Self merge(Self? other);
}

/// Represents a [Dto] Data transfer object of [Shadow]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a [Shadow]
///
/// See also:
/// - [Shadow], which is the Flutter counterpart of this class.
/// - [ShadowDtoImpl], which is the base class for this class.
@immutable
class ShadowDto extends ShadowDtoImpl<ShadowDto, Shadow> {
  const ShadowDto({super.blurRadius, super.color, super.offset});

  /// Creates a [ShadowDto] from a [Shadow]
  static ShadowDto from(Shadow shadow) {
    return ShadowDto(
      blurRadius: shadow.blurRadius,
      color: ColorDto.maybeFrom(shadow.color),
      offset: shadow.offset,
    );
  }

  /// Creates a [ShadowDto] from a [Shadow]
  ///
  /// Returns null if [shadow] is null
  static ShadowDto? maybeFrom(Shadow? shadow) {
    return shadow == null ? null : from(shadow);
  }

  /// Resolves this [ShadowDto] with a given [MixData] to a [Shadow]
  @override
  Shadow resolve(MixData mix) {
    const defaultShadow = Shadow();

    return Shadow(
      color: color?.resolve(mix) ?? defaultShadow.color,
      offset: offset ?? defaultShadow.offset,
      blurRadius: blurRadius ?? defaultShadow.blurRadius,
    );
  }

  /// Merges this [ShadowDto] with `other` [ShadowDto]
  @override
  ShadowDto merge(ShadowDto? other) {
    if (other == null) return this;

    return ShadowDto(
      blurRadius: other.blurRadius ?? blurRadius,
      color: color?.merge(other.color) ?? other.color,
      offset: other.offset ?? offset,
    );
  }

  @override
  get props => [color, offset, blurRadius];
}

/// Represents a [Dto] Data transfer object of [BoxShadow]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[BoxShadow]
///
/// See also:
/// - [BoxShadow], which is the Flutter counterpart of this class.
/// - [ShadowDtoImpl], which is the base class for this class.
class BoxShadowDto extends ShadowDtoImpl<BoxShadowDto, BoxShadow> {
  final double? spreadRadius;

  const BoxShadowDto({
    super.color,
    super.offset,
    super.blurRadius,
    this.spreadRadius,
  });

  /// Creates a [BoxShadowDto] from a [BoxShadow]
  static BoxShadowDto from(BoxShadow shadow) {
    return BoxShadowDto(
      color: ColorDto.maybeFrom(shadow.color),
      offset: shadow.offset,
      blurRadius: shadow.blurRadius,
      spreadRadius: shadow.spreadRadius,
    );
  }

  /// Creates a [BoxShadowDto] from a [BoxShadow]
  static BoxShadowDto? maybeFrom(BoxShadow? shadow) {
    return shadow == null ? null : from(shadow);
  }

  /// Resolves this [BoxShadowDto] with a given [MixData] to a [BoxShadow]
  @override
  BoxShadow resolve(MixData mix) {
    const defaultShadow = BoxShadow();

    return BoxShadow(
      color: color?.resolve(mix) ?? defaultShadow.color,
      offset: offset ?? defaultShadow.offset,
      blurRadius: blurRadius ?? defaultShadow.blurRadius,
      spreadRadius: spreadRadius ?? defaultShadow.spreadRadius,
    );
  }

  /// Merges this [BoxShadowDto] with `other` [BoxShadowDto]
  @override
  BoxShadowDto merge(BoxShadowDto? other) {
    if (other == null) return this;

    return BoxShadowDto(
      color: color?.merge(other.color) ?? other.color,
      offset: other.offset ?? offset,
      blurRadius: other.blurRadius ?? blurRadius,
      spreadRadius: other.spreadRadius ?? spreadRadius,
    );
  }

  @override
  get props => [color, offset, blurRadius, spreadRadius];
}
