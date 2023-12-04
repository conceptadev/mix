import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  test('MixBreakpointsTokens', () {
    final breakpoints = MixThemeData().breakpoints;
    final context = MockBuildContext();
    final large = breakpoints(BreakpointToken.large, context);
    final medium = breakpoints(BreakpointToken.medium, context);
    final small = breakpoints(BreakpointToken.small, context);
    final xsmall = breakpoints(BreakpointToken.xsmall, context);

    expect(
      large,
      const BreakpointConstraint(minWidth: 1440, maxWidth: double.infinity),
    );
    expect(
      medium,
      const BreakpointConstraint(minWidth: 1024, maxWidth: 1439),
    );
    expect(
      small,
      const BreakpointConstraint(minWidth: 600, maxWidth: 1023),
    );
    expect(
      xsmall,
      const BreakpointConstraint(minWidth: 0, maxWidth: 599),
    );
  });

  test('MixBreakpointsTokens large matches correctly', () {
    final breakpoints = MixThemeData().breakpoints;
    final context = MockBuildContext();
    final large = breakpoints(BreakpointToken.large, context);

    expect(
      large.matches(const Size(1440, 1024)),
      true,
    );

    expect(
      large.matches(const Size(1439, 1024)),
      false,
    );
  });

  test('MixBreakpointsTokens medium matches correctly', () {
    final breakpoints = MixThemeData().breakpoints;
    final context = MockBuildContext();
    final medium = breakpoints(BreakpointToken.medium, context);

    expect(
      medium.matches(const Size(1024, 1024)),
      true,
    );

    expect(
      medium.matches(const Size(1023, 1024)),
      false,
    );
  });

  test('MixBreakpointsTokens small matches correctly', () {
    final breakpoints = MixThemeData().breakpoints;
    final context = MockBuildContext();
    final small = breakpoints(BreakpointToken.small, context);

    expect(
      small.matches(const Size(600, 1024)),
      true,
    );

    expect(
      small.matches(const Size(599, 1024)),
      false,
    );
  });

  test('MixBreakpointsTokens xsmall matches correctly', () {
    final breakpoints = MixThemeData().breakpoints;
    final context = MockBuildContext();
    final xsmall = breakpoints(BreakpointToken.xsmall, context);

    expect(
      xsmall.matches(const Size(0, 1024)),
      true,
    );

    expect(
      xsmall.matches(const Size(-1, 1024)),
      false,
    );
  });
}
