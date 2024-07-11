import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/tokens/color_tokens.dart';
import 'package:remix/tokens/radius_tokens.dart';
import 'package:remix/tokens/space_tokens.dart';
import 'package:remix/tokens/text_style_tokens.dart';

final $rx = _RemixTokenRef();

class _RemixTokenRef {
  _RemixTokenRef();
  final color = RemixColors();

  final space = RemixSpace();

  final radii = RemixRadius();

  final text = RemixTypography();
}

final _baseRemixTokens = MixThemeData(
  colors: remixColorTokens,
  textStyles: remixTextTokens,
  spaces: remixSpaceTokens,
  radii: remixRadiusTokens,
);

final _lightRemixTokens = _baseRemixTokens;
final _darkRemixTokens = _baseRemixTokens.copyWith(
  colors: remixDarkColorTokens,
);

class RemixTokens extends StatelessWidget {
  const RemixTokens({super.key, required this.child, required this.data});

  final Widget child;

  final MixThemeData data;

  static MixThemeData light = _lightRemixTokens;
  static MixThemeData dark = _darkRemixTokens;

  @override
  Widget build(BuildContext context) {
    return MixTheme(
      data: data,
      child: child,
    );
  }
}
