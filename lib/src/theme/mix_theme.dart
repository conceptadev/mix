import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:mix/src/theme/refs/refs.dart';
import 'package:mix/src/theme/tokens/breakpoints_token.dart';
import 'package:mix/src/theme/tokens/space_token.dart';

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
  const MixThemeData.raw({
    required this.space,
    required this.breakpoints,
    // TODO: implement font family
    required this.contextRef,
  });

  factory MixThemeData({
    MixThemeSpace? space,
    MixThemeBreakpoints? breakpoints,
    ContextRefTokens? contextRef,
  }) {
    space ??= MixThemeSpace();
    breakpoints ??= MixThemeBreakpoints();
    contextRef = ContextRefTokens.defaults.merge(contextRef);
    return MixThemeData.raw(
      space: space,
      breakpoints: breakpoints,
      contextRef: contextRef,
    );
  }

  final MixThemeSpace space;
  final MixThemeBreakpoints breakpoints;
  final ContextRefTokens contextRef;

  MixThemeData copyWith({
    MixThemeSpace? space,
    MixThemeBreakpoints? breakpoints,
    ContextRefTokens? contextRef,
  }) {
    return MixThemeData.raw(
      space: space ?? this.space,
      breakpoints: breakpoints ?? this.breakpoints,
      contextRef: contextRef ?? this.contextRef,
    );
  }

  @override
  String toString() =>
      'MixThemeData(space: $space, breakpoints: $breakpoints, tokens: $contextRef)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixThemeData &&
        other.space == space &&
        other.breakpoints == breakpoints &&
        other.contextRef == contextRef;
  }

  @override
  int get hashCode {
    return space.hashCode ^ breakpoints.hashCode ^ contextRef.hashCode;
  }
}
