import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../resolvable_attribute.dart';

class Matrix4Attribute extends ResolvableAttribute<Matrix4> {
  final Matrix4 matrix;

  const Matrix4Attribute(this.matrix);

  @override
  Matrix4 resolve(MixData mix) {
    return matrix;
  }

  @override
  Matrix4Attribute merge(Matrix4Attribute? other) {
    if (other == null) return this;

    return Matrix4Attribute(other.matrix);
  }

  @override
  get props => [matrix];
}
