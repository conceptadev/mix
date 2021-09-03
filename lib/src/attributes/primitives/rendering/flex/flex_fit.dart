import 'package:flutter/material.dart';

import '../../../base_attribute.dart';

class FlexFitUtility {
  const FlexFitUtility();
  FlexFitAttribute loose() => const FlexFitAttribute(FlexFit.loose);
  FlexFitAttribute tight() => const FlexFitAttribute(FlexFit.tight);
}

class FlexFitAttribute extends Attribute<FlexFit> {
  const FlexFitAttribute(this.fit);

  final FlexFit fit;
  @override
  FlexFit get value => fit;
}
