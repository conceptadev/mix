import 'package:flutter/widgets.dart';

typedef XComponentBuilder<T> = Widget Function(
  BuildContext context,
  T spec,
);
