import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/src/theme/theme_data.dart';

class MixTheme extends InheritedWidget {
  MixTheme({
    Key? key,
    required Widget child,
    MixThemeData? theme,
  })  : data = MixThemeData.defaults.merge(theme),
        super(key: key, child: child);

  final MixThemeData data;

  static MixThemeData of(BuildContext context) {
    final mixTheme = context.dependOnInheritedWidgetOfExactType<MixTheme>();
    if (mixTheme != null) {
      return mixTheme.data;
    } else {
      return MixThemeData.defaults;
    }
  }

  @override
  bool updateShouldNotify(MixTheme oldWidget) {
    return data != oldWidget.data;
  }
}
