import 'package:flutter/widgets.dart';

import 'breakpoints_token.dart';
import 'color_token.dart';
import 'radius_token.dart';
import 'space_token.dart';
import 'text_style_token.dart';

class MixTokenResolver {
  final BuildContext _context;

  const MixTokenResolver(this._context);

  Color colorToken(ColorToken token) => token.resolve(_context);

  Color colorRef(ColorRef ref) => colorToken(ref.token);

  Radius radiiToken(RadiusToken token) => token.resolve(_context);

  Radius radiiRef(RadiusRef ref) => radiiToken(ref.token);

  TextStyle textStyleToken(TextStyleToken token) => token.resolve(_context);

  TextStyle textStyleRef(TextStyleRef ref) => textStyleToken(ref.token);

  double spaceToken(SpaceToken token) => token.resolve(_context);

  double spaceTokenRef(SpaceRef spaceRef) {
    return spaceRef < 0 ? spaceRef.resolve(_context) : spaceRef;
  }

  Breakpoint breakpointToken(BreakpointToken token) => token.resolve(_context);
}
