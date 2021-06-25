import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class FlexFitUtility {
  FlexFitAttribute get loose => FlexFitAttribute(FlexFit.loose);
  FlexFitAttribute get tight => FlexFitAttribute(FlexFit.tight);
}

class FlexFitAttribute extends Attribute<FlexFit> {
  const FlexFitAttribute(this.fit);

  final FlexFit fit;

  FlexFit get value => fit;
}
