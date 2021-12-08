import 'package:mix/mix.dart';

class Remix<T extends RemixableWidget> {
  const Remix._(this.widget);

  final Type widget;
}
