import 'package:flutter/material.dart';

import '../../core/dto.dart';
import '../../core/mix_data.dart';
import '../color/color_dto.dart';

@immutable
abstract class ShadowDtoImpl<Self extends ShadowDtoImpl<Self, Value>,
    Value extends Shadow> extends Dto<Value> {
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

  /// Resolves this [ShadowDto] with a given [MixData] to a [Shadow]
  @override
  Shadow resolve(MixData mix) {
    const defaultValue = Shadow();

    return Shadow(
      color: color?.resolve(mix) ?? defaultValue.color,
      offset: offset ?? defaultValue.offset,
      blurRadius: blurRadius ?? defaultValue.blurRadius,
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

extension ShadowExt on Shadow {
  ShadowDto toDto() {
    return ShadowDto(
      blurRadius: blurRadius,
      color: ColorDto(color),
      offset: offset,
    );
  }
}

extension BoxShadowExt on BoxShadow {
  BoxShadowDto toDto() {
    return BoxShadowDto(
      color: ColorDto(color),
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );
  }
}

extension ListShadowExt on List<Shadow> {
  List<ShadowDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

extension ListBoxShadowExt on List<BoxShadow> {
  List<BoxShadowDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
