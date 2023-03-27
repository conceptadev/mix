import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/helpers/dto/border.dto.dart';
import 'package:mix/src/helpers/dto/border_radius.dto.dart';
import 'package:mix/src/helpers/dto/box_shadow.dto.dart';
import 'package:mix/src/helpers/dto/color.dto.dart';
import 'package:mix/src/helpers/dto/edge_insets.dto.dart';
import 'package:mix/src/helpers/dto/text_style.dto.dart';
import 'package:mix/src/widgets/text/text_directives/text_directive.attributes.dart';

export 'package:mix/src/helpers/extensions.dart';

class TestMixWidget extends StatelessWidget {
  const TestMixWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: child,
    );
  }
}

// ignore: constant_identifier_names
const FillWidget = SizedBox(
  height: 25,
  width: 25,
);

class WrapMixThemeWidget extends StatelessWidget {
  const WrapMixThemeWidget({
    required this.child,
    this.theme,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final MixThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return MixTheme(
      data: theme ?? MixThemeData(),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: child,
      ),
    );
  }
}

class BoxInsideFlexWidget extends StatelessWidget {
  const BoxInsideFlexWidget(this.mix, {Key? key}) : super(key: key);

  final Mix mix;

  @override
  Widget build(BuildContext context) {
    return TestMixWidget(
      child: Column(
        children: [
          Box(
            mix: mix,
            child: FillWidget,
          ),
        ],
      ),
    );
  }
}

class BoxTestWidget extends StatelessWidget {
  const BoxTestWidget(
    this.mix, {
    Key? key,
    double? height,
    double? width,
  }) : super(key: key);

  final Mix mix;

  @override
  Widget build(BuildContext context) {
    return TestMixWidget(
      child: Box(
        mix: mix,
        child: const SizedBox(
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}

TextAttributes randomTextAttributes() {
  return TextAttributes(
    style: TextStyleDto.random(),
    textAlign: TextAlign.values.random(),
    softWrap: Random().nextBool(),
    overflow: TextOverflow.values.random(),
    textWidthBasis: TextWidthBasis.values.random(),
    textHeightBehavior: const TextHeightBehavior(),
    directives: [
      const UppercaseDirective(),
      const LowercaseDirective(),
      const CapitalizeDirective(),
      const SentenceCaseDirective(),
    ],
  );
}

Mix randomMix() {
  return Mix(
    randomTextAttributes(),
    randomTextAttributes(),
    randomBoxAttributes(),
    randomBoxAttributes(),
  );
}

BoxAttributes randomBoxAttributes({
  bool someNullable = true,
}) {
  final margin = EdgeInsetsDto.random();

  final padding = EdgeInsetsDto.random();

  final alignment = Random().randomElement([
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
  ]);

  final height = Random().nextMaxDouble(500);

  final width = Random().nextMaxDouble(500);

  final color = ColorDto.random();

  final border = BorderDto.random();

  const borderRadius = BorderRadiusDto.only();

  final boxShadow = [
    BoxShadowDto.random(),
    BoxShadowDto.random(),
    BoxShadowDto.random(),
    BoxShadowDto.random(),
  ];

  final maxHeight = Random().nextMaxDouble(500);

  final minHeight = Random().nextMaxDouble(maxHeight);

  final maxWidth = Random().nextMaxDouble(500);

  final minWidth = Random().nextMaxDouble(maxWidth);

  final shape = Random().randomElement(BoxShape.values);

  final boxAttributes = BoxAttributes(
    margin: margin,
    padding: padding,
    alignment: alignment,
    height: height,
    width: width,
    color: color,
    border: border,
    borderRadius: borderRadius,
    boxShadow: boxShadow,
    maxHeight: maxHeight,
    minHeight: minHeight,
    maxWidth: maxWidth,
    minWidth: minWidth,
    shape: shape,
  );

  if (someNullable) {
    return BoxAttributes(
      margin: Random().nextBool() ? margin : null,
      padding: Random().nextBool() ? padding : null,
      alignment: Random().nextBool() ? alignment : null,
      height: Random().nextBool() ? height : null,
      width: Random().nextBool() ? width : null,
      color: Random().nextBool() ? color : null,
      border: Random().nextBool() ? border : null,
      borderRadius: Random().nextBool() ? borderRadius : null,
      boxShadow: Random().nextBool() ? boxShadow : null,
      maxHeight: Random().nextBool() ? maxHeight : null,
      minHeight: Random().nextBool() ? minHeight : null,
      maxWidth: Random().nextBool() ? maxWidth : null,
      minWidth: Random().nextBool() ? minWidth : null,
      shape: Random().nextBool() ? shape : null,
    );
  }

  return boxAttributes;
}
