import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/src/theme/tokens/breakpoints.dart';
import 'package:mix/src/theme/tokens/space.dart';

class MixTheme extends InheritedWidget {
  const MixTheme({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final MixThemeData data;

  static MixThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MixTheme>()?.data ??
        MixThemeData();
  }

  static MixThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MixTheme>()?.data;
  }

  @override
  bool updateShouldNotify(MixTheme oldWidget) {
    return data != oldWidget.data;
  }
}

class MixThemeData {
  final MixThemeSpace space;
  final MixThemeBreakpoints breakpoints;

  const MixThemeData.raw({
    required this.space,
    required this.breakpoints,
    // TODO: implement font family
  });

  factory MixThemeData({
    MixThemeSpace? space,
    MixThemeBreakpoints? breakpoints,
  }) {
    space ??= const MixThemeSpace();
    breakpoints ??= MixThemeBreakpoints();

    return MixThemeData.raw(
      space: space,
      breakpoints: breakpoints,
    );
  }

  MixThemeData copyWith({
    MixThemeSpace? space,
    MixThemeBreakpoints? breakpoints,
  }) {
    return MixThemeData.raw(
      space: space ?? this.space,
      breakpoints: breakpoints ?? this.breakpoints,
    );
  }

  @override
  String toString() => 'MixThemeData(space: $space, breakpoints: $breakpoints';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixThemeData &&
        other.space == space &&
        other.breakpoints == breakpoints;
  }

  @override
  int get hashCode {
    return space.hashCode ^ breakpoints.hashCode;
  }
}
