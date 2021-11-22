import 'package:flutter/widgets.dart';

abstract class Dto<T> {
  const Dto();

  T create(BuildContext context);
}
