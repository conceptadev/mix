import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:remix/helpers/context_ext.dart';
import 'package:remix/tokens/color_tokens.dart';
import 'package:remix/tokens/radius_tokens.dart';
import 'package:remix/tokens/space_tokens.dart';
import 'package:remix/tokens/text_style_tokens.dart';

final $rx = _RemixTokenRef();

class _RemixTokenRef {
  _RemixTokenRef();
  final _color = const RemixColor();
  late final accent1 = _color.accent1;
  late final accent2 = _color.accent2;
  late final accent3 = _color.accent3;
  late final accent4 = _color.accent4;
  late final accent5 = _color.accent5;
  late final accent6 = _color.accent6;
  late final accent7 = _color.accent7;
  late final accent8 = _color.accent8;
  late final accent9 = _color.accent9;
  late final accent10 = _color.accent10;
  late final accent11 = _color.accent11;
  late final accent12 = _color.accent12;
  late final accent1A = _color.accent1A;
  late final accent2A = _color.accent2A;
  late final accent3A = _color.accent3A;
  late final accent4A = _color.accent4A;
  late final accent5A = _color.accent5A;
  late final accent6A = _color.accent6A;
  late final accent7A = _color.accent7A;
  late final accent8A = _color.accent8A;
  late final accent9A = _color.accent9A;
  late final accent10A = _color.accent10A;
  late final accent11A = _color.accent11A;
  late final accent12A = _color.accent12A;
  late final neutral1 = _color.neutral1;
  late final neutral2 = _color.neutral2;
  late final neutral3 = _color.neutral3;
  late final neutral4 = _color.neutral4;
  late final neutral5 = _color.neutral5;
  late final neutral6 = _color.neutral6;
  late final neutral7 = _color.neutral7;
  late final neutral8 = _color.neutral8;
  late final neutral9 = _color.neutral9;
  late final neutral10 = _color.neutral10;
  late final neutral11 = _color.neutral11;
  late final neutral12 = _color.neutral12;
  late final neutral1A = _color.neutral1A;
  late final neutral2A = _color.neutral2A;
  late final neutral3A = _color.neutral3A;
  late final neutral4A = _color.neutral4A;
  late final neutral5A = _color.neutral5A;
  late final neutral6A = _color.neutral6A;
  late final neutral7A = _color.neutral7A;
  late final neutral8A = _color.neutral8A;
  late final neutral9A = _color.neutral9A;
  late final neutral10A = _color.neutral10A;
  late final neutral11A = _color.neutral11A;
  late final neutral12A = _color.neutral12A;

  final _space = const RemixSpace();
  late final space1 = _space.s1;
  late final space2 = _space.s2;
  late final space3 = _space.s3;
  late final space4 = _space.s4;
  late final space5 = _space.s5;
  late final space6 = _space.s6;
  late final space7 = _space.s7;
  late final space8 = _space.s8;
  late final space9 = _space.s9;

  final _radius = const RemixRadius();
  late final radius1 = _radius.r1;
  late final radius2 = _radius.r2;
  late final radius3 = _radius.r3;
  late final radius4 = _radius.r4;
  late final radius5 = _radius.r5;
  late final radius6 = _radius.r6;

  final _text = const RemixTypography();
  late final text1 = _text.t1;
  late final text2 = _text.t2;
  late final text3 = _text.t3;
  late final text4 = _text.t4;
  late final text5 = _text.t5;
  late final text6 = _text.t6;
  late final text7 = _text.t7;
  late final text8 = _text.t8;
  late final text9 = _text.t9;
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
  const RemixTokens({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MixTheme(
      data: context.isDarkMode ? _darkRemixTokens : _lightRemixTokens,
      child: child,
    );
  }
}
