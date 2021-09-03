import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class BoxFitUtility {
  const BoxFitUtility();
  BoxFitAttribute get contain => const BoxFitAttribute(BoxFit.contain);
  BoxFitAttribute get fill => const BoxFitAttribute(BoxFit.fill);
  BoxFitAttribute get cover => const BoxFitAttribute(BoxFit.cover);
  BoxFitAttribute get fitWidth => const BoxFitAttribute(BoxFit.fitWidth);
  BoxFitAttribute get fitHeight => const BoxFitAttribute(BoxFit.fitHeight);
}

class BoxFitAttribute extends Attribute<BoxFit> {
  const BoxFitAttribute(this.boxFit);

  final BoxFit boxFit;
  @override
  BoxFit get value => boxFit;
}
