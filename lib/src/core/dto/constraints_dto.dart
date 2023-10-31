import 'package:flutter/rendering.dart';

import '../../attributes/data_attributes.dart';
import '../../factory/mix_provider_data.dart';
import '../attribute.dart';

abstract class ConstraintsData<T extends Constraints> extends Data<T> {
  const ConstraintsData();

  @override
  ConstraintsData merge(covariant ConstraintsData? other);

  @override
  T resolve(MixData mix);
}

class BoxConstraintsData extends ConstraintsData<BoxConstraints> {
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  const BoxConstraintsData({
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
  });

  BoxConstraintsAttribute toAttribute() => BoxConstraintsAttribute(this);

  @override
  BoxConstraintsData merge(covariant BoxConstraintsData? other) {
    if (other == null) return this;

    return BoxConstraintsData(
      minWidth: other.minWidth ?? minWidth,
      maxWidth: other.maxWidth ?? maxWidth,
      minHeight: other.minHeight ?? minHeight,
      maxHeight: other.maxHeight ?? maxHeight,
    );
  }

  @override
  BoxConstraints resolve(MixData mix) {
    return BoxConstraints(
      minWidth: minWidth ?? 0,
      maxWidth: maxWidth ?? double.infinity,
      minHeight: minHeight ?? 0,
      maxHeight: maxHeight ?? double.infinity,
    );
  }

  @override
  get props => [minWidth, maxWidth, minHeight, maxHeight];
}
