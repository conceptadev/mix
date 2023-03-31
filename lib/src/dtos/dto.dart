import 'package:flutter/widgets.dart';

import '../helpers/equatable_mixin.dart';

abstract class Dto<T> with EquatableMixin {
  const Dto();

  T resolve(BuildContext context);
}
