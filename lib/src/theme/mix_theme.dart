import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/src/theme/refs/refs.dart';
import 'package:mix/src/theme/tokens/breakpoints_token.dart';
import 'package:mix/src/theme/tokens/space_token.dart';

class MixTheme extends InheritedWidget {
  MixTheme({
    Key? key,
    required Widget child,
    MixThemeData? theme,
  })  : data = MixThemeData.defaults().merge(theme),
        super(key: key, child: child);

  final MixThemeData data;

  static MixThemeData of(BuildContext context) {
    final mixTheme = context.dependOnInheritedWidgetOfExactType<MixTheme>();
    if (mixTheme != null) {
      return mixTheme.data;
    } else {
      return MixThemeData.defaults();
    }
  }

  @override
  bool updateShouldNotify(MixTheme oldWidget) {
    return data != oldWidget.data;
  }
}

class MixThemeData {
  MixThemeData._({
    required this.space,
    required this.breakpoints,
    //TODO: implement font family
    required this.contextRef,
  });

  factory MixThemeData.defaults() {
    return MixThemeData._(
      space: MixThemeSpace.defaults,
      breakpoints: MixThemeBreakpoints.defaults,
      contextRef: ContextRefTokens.defaults(),
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
    return MixThemeData._(
      space: space ?? this.space,
      breakpoints: breakpoints ?? this.breakpoints,
      contextRef: contextRef ?? this.contextRef,
    );
  }

  MixThemeData merge(MixThemeData? other) {
    if (other == null) return this;

    return copyWith(
      space: other.space,
      breakpoints: other.breakpoints,
      contextRef: other.contextRef,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixThemeData &&
        other.space == space &&
        other.breakpoints == breakpoints &&
        other.contextRef == contextRef;
  }

  @override
  int get hashCode =>
      space.hashCode ^ breakpoints.hashCode ^ contextRef.hashCode;

  @override
  String toString() =>
      'MixThemeData(space: $space, breakpoints: $breakpoints, tokens: $contextRef)';
}
