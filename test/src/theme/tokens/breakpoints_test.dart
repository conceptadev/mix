import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

// import '../../../helpers/testing_utils.dart';

// import 'package:flutter/material.dart';

// import 'mix_token.dart';

// enum BreakpointOrientation {
//   portrait,
//   landscape,
//   all,
// }

// class BreakpointConstraint {
//   final double minWidth;
//   final double maxWidth;
//   final BreakpointOrientation orientation;

//   const BreakpointConstraint({
//     this.minWidth = 0,
//     this.maxWidth = double.infinity,
//     this.orientation = BreakpointOrientation.all,
//   });

//   bool matches(Size size) {
//     final matchesWidth = size.width >= minWidth && size.width <= maxWidth;
//     final matchesOrientation = orientation == BreakpointOrientation.all ||
//         (orientation == BreakpointOrientation.portrait &&
//             size.height > size.width) ||
//         (orientation == BreakpointOrientation.landscape &&
//             size.width > size.height);

//     return matchesWidth && matchesOrientation;
//   }
// }

// class BreakpointToken extends MixToken<BreakpointConstraint> {
//   static const xsmall = BreakpointToken('--mix-breakpoint-xsmall');
//   static const small = BreakpointToken('--mix-breakpoint-small');
//   static const medium = BreakpointToken('--mix-breakpoint-medium');
//   static const large = BreakpointToken('--mix-breakpoint-large');

//   const BreakpointToken(super.name);
// }

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
}
