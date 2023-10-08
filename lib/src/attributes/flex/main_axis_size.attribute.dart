import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../style_attribute.dart';

class MainAxisSizeAttribute extends StyleAttribute<MainAxisSize> {
  final MainAxisSize size;

  const MainAxisSizeAttribute(this.size);

  @override
  MainAxisSizeAttribute merge(MainAxisSizeAttribute? other) =>
      MainAxisSizeAttribute(other?.size ?? size);

  @override
  MainAxisSize resolve(MixData mix) => size;
  @override
  List<Object?> get props => [size];
}
