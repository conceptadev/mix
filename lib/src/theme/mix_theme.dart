import 'package:flutter/material.dart';

import 'headless/headless.theme.dart';
import 'tokens/breakpoints.dart';
import 'tokens/space.dart';

final cacheMap = <int, MixThemeData>{};

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
  final HeadlessThemeData headlessThemeData;

  const MixThemeData.raw({
    required this.space,
    required this.breakpoints,
    required this.headlessThemeData,
    // TODO: implement font family
  });

  MixThemeData({
    MixThemeSpace? space,
    MixThemeBreakpoints? breakpoints,
    HeadlessThemeData? headlessThemeData,
  }) : this.raw(
          space: space ?? const MixThemeSpace(),
          breakpoints: breakpoints ?? const MixThemeBreakpoints(),
          headlessThemeData: headlessThemeData ?? HeadlessThemeData(),
        );

  MixThemeData copyWith({
    MixThemeSpace? space,
    MixThemeBreakpoints? breakpoints,
    HeadlessThemeData? headlessThemeData,
  }) {
    return MixThemeData.raw(
      space: space ?? this.space,
      breakpoints: breakpoints ?? this.breakpoints,
      headlessThemeData: headlessThemeData ?? this.headlessThemeData,
    );
  }

  @override
  String toString() =>
      'MixThemeData(space: $space, breakpoints: $breakpoints, headlessThemeData: $headlessThemeData)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixThemeData &&
        other.space == space &&
        other.breakpoints == breakpoints &&
        other.headlessThemeData == headlessThemeData;
  }

  @override
  int get hashCode {
    return space.hashCode ^ breakpoints.hashCode ^ headlessThemeData.hashCode;
  }
}
