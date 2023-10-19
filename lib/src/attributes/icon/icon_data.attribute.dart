import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../style_attribute.dart';

class IconDataAttribute extends StyleAttribute<IconData> {
  final IconData iconData;

  const IconDataAttribute(this.iconData);

  @override
  IconDataAttribute merge(IconDataAttribute? other) =>
      IconDataAttribute(other?.iconData ?? iconData);

  @override
  IconData resolve(MixData mix) => iconData;

  @override
  List<Object?> get props => [iconData];
}
