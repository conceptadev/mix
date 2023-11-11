import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  test('MixBreakpointsTokens', () {
    final breakpoints = MixThemeData().breakpoints;
    final context = MockBuildContext();
    final large = breakpoints[BreakpointToken.large]!(context);
    final medium = breakpoints[BreakpointToken.medium]!(context);
    final small = breakpoints[BreakpointToken.small]!(context);
    final xsmall = breakpoints[BreakpointToken.xsmall]!(context);

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
    final large = breakpoints[BreakpointToken.large]!(context);

    expect(
      large.matches(const Size(1440, 1024)),
      true,
    );

    expect(
      large.matches(const Size(1439, 1024)),
      false,
    );
  });

  test('Test orientation for Breakpoint tokens', () {
    const portraitBreakpoint = BreakpointToken('--custom-breakpoint');
    const landscapeBreakpoint = BreakpointToken('--another-breakpoint');
    final breakpoints = MixThemeData(
      breakpoints: {
        portraitBreakpoint: (context) => const BreakpointConstraint(
              orientation: BreakpointOrientation.portrait,
            ),
        landscapeBreakpoint: (context) => const BreakpointConstraint(
              orientation: BreakpointOrientation.landscape,
            )
      },
    ).breakpoints;
    final context = MockBuildContext();
    final portrait = breakpoints[portraitBreakpoint]!(context);
    final landscape = breakpoints[landscapeBreakpoint]!(context);

    const portraitSize = Size(2000, 3000);
    const landscapeSize = Size(3000, 2000);

    expect(
      portrait.matches(portraitSize),
      true,
    );

    expect(
      landscape.matches(portraitSize),
      false,
    );

    expect(
      portrait.matches(landscapeSize),
      false,
    );

    expect(
      landscape.matches(landscapeSize),
      true,
    );
  });
}
