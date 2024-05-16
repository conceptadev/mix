import 'package:flutter/rendering.dart';

import '../../core/dto.dart';
import '../../factory/mix_provider_data.dart';

abstract class ConstraintsDto<Self extends ConstraintsDto<Self, Value>,
    Value extends Constraints> extends Dto<Value> {
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

// Imple,ent the from as a toDto extension
extension BoxConstraintsExt on BoxConstraints {
  // toDto
  BoxConstraintsDto toDto() {
    return BoxConstraintsDto(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
  }
}
