import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

final theme = MixThemeData(
  colors: {
    // expect_lint: mix_externalize_token_instantiation
    ColorToken('a'): Colors.black,
  },
  breakpoints: {
    // expect_lint: mix_externalize_token_instantiation
    BreakpointToken('a'): Breakpoint(),
  },
  radii: {
    // expect_lint: mix_externalize_token_instantiation
    RadiusToken('a'): Radius.circular(10),
  },
  spaces: {
    // expect_lint: mix_externalize_token_instantiation
    SpaceToken('a'): 10,
  },
  textStyles: {
    // expect_lint: mix_externalize_token_instantiation
    TextStyleToken('a'): TextStyle(
      color: Colors.black,
    ),
  },
);

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
