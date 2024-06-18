import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

// Wrong case
final theme = MixThemeData(
  colors: {
    // expect_lint: mix_avoid_defining_tokens_within_theme_data
    ColorToken('a'): Colors.black,
  },
  breakpoints: {
    // expect_lint: mix_avoid_defining_tokens_within_theme_data
    BreakpointToken('a'): Breakpoint(),
  },
  radii: {
    // expect_lint: mix_avoid_defining_tokens_within_theme_data
    RadiusToken('a'): Radius.circular(10),
  },
  spaces: {
    // expect_lint: mix_avoid_defining_tokens_within_theme_data
    SpaceToken('a'): 10,
  },
  textStyles: {
    // expect_lint: mix_avoid_defining_tokens_within_theme_data
    TextStyleToken('a'): TextStyle(
      color: Colors.black,
    ),
  },
);

// Correct case
final colorToken = ColorToken('a');
final breakpointToken = BreakpointToken('b');
final radiusToken = RadiusToken('c');
final spaceToken = SpaceToken('d');
final textStyleToken = TextStyleToken('e');

final otherTheme = MixThemeData(
  colors: {
    colorToken: Colors.black,
  },
  breakpoints: {
    breakpointToken: Breakpoint(),
  },
  radii: {
    radiusToken: Radius.circular(10),
  },
  spaces: {
    spaceToken: 10,
  },
  textStyles: {
    textStyleToken: TextStyle(
      color: Colors.black,
    ),
  },
);
