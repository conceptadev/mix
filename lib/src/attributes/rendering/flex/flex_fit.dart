import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class FlexFitUtility {
  const FlexFitUtility();
  FlexFitAttribute get loose => const FlexFitAttribute(FlexFit.loose);
  FlexFitAttribute get tight => const FlexFitAttribute(FlexFit.tight);
}

class FlexFitAttribute extends Attribute<FlexFit> {
  const FlexFitAttribute(this.fit);

  final FlexFit fit;
  @override
  FlexFit get value => fit;
}
