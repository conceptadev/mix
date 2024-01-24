import 'package:flutter/rendering.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';

abstract class ConstraintsDto<Self extends ConstraintsDto<Self, Value>,
    Value extends Constraints> extends Dto<Value> with Mergeable<Self> {
  const ConstraintsDto();
}

/// Represents a Data transfer object of [BoxConstraints]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[BoxConstraints]
///
/// See also:
/// - [BoxConstraints], which is the Flutter counterpart of this class.
/// - [ConstraintsDto], which is the base class for this class.
///
/// {@category DTO}
class BoxConstraintsDto
    extends ConstraintsDto<BoxConstraintsDto, BoxConstraints> {
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  const BoxConstraintsDto({
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
  });

  /// Creates a [BoxConstraintsDto] from a given [BoxConstraints].
  static BoxConstraintsDto from(BoxConstraints constraints) {
    return BoxConstraintsDto(
      minWidth: constraints.minWidth,
      maxWidth: constraints.maxWidth,
      minHeight: constraints.minHeight,
      maxHeight: constraints.maxHeight,
    );
  }

  /// Creates a [BoxConstraintsDto] from a given [BoxConstraints].
  ///
  /// Returns null if the constraints are null.
  static BoxConstraintsDto? maybeFrom(BoxConstraints? constraints) {
    return constraints == null ? null : from(constraints);
  }

  /// Resolves this [BoxConstraintsDto] with a given [MixData] to a [BoxConstraints]
  @override
  BoxConstraints resolve(MixData mix) {
    return BoxConstraints(
      minWidth: minWidth ?? 0,
      maxWidth: maxWidth ?? double.infinity,
      minHeight: minHeight ?? 0,
      maxHeight: maxHeight ?? double.infinity,
    );
  }

  /// Merges this [BoxConstraintsDto] with `other` [BoxConstraintsDto]
  @override
  BoxConstraintsDto merge(BoxConstraintsDto? other) {
    if (other == null) return this;

    return BoxConstraintsDto(
      minWidth: other.minWidth ?? minWidth,
      maxWidth: other.maxWidth ?? maxWidth,
      minHeight: other.minHeight ?? minHeight,
      maxHeight: other.maxHeight ?? maxHeight,
    );
  }

  @override
  get props => [minWidth, maxWidth, minHeight, maxHeight];
}
