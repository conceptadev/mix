import 'package:flutter/widgets.dart';

typedef RxComponentBuilder<T> = Widget Function(
  BuildContext context,
  T spec,
);
