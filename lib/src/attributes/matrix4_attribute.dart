import 'package:flutter/widgets.dart';

import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';

class Matrix4Attribute extends StyleAttribute<Matrix4> {
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
