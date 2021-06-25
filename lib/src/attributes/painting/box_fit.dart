import 'package:flutter/material.dart';

import '../base_attribute.dart';

class BoxFitUtility {
  BoxFitAttribute get contain => BoxFitAttribute(BoxFit.contain);
  BoxFitAttribute get fill => BoxFitAttribute(BoxFit.fill);
  BoxFitAttribute get cover => BoxFitAttribute(BoxFit.cover);
  BoxFitAttribute get fitWidth => BoxFitAttribute(BoxFit.fitWidth);
  BoxFitAttribute get fitHeight => BoxFitAttribute(BoxFit.fitHeight);
}

class BoxFitAttribute extends Attribute<BoxFit> {
  const BoxFitAttribute(this.boxFit);

  final BoxFit boxFit;

  BoxFit get value => boxFit;
}
