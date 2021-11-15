import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class MixerNotifier extends InheritedWidget {
  const MixerNotifier({
    Key? key,
    required Widget child,
    this.mixer,
  }) : super(key: key, child: child);

  final Mixer? mixer;

  static Mixer? of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<MixerNotifier>();
    return widget?.mixer;
  }

  @override
  bool updateShouldNotify(MixerNotifier oldWidget) {
    return mixer != oldWidget.mixer;
  }
}
