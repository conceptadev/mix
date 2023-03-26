import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/helpers/dto/border.dto.dart';
import 'package:mix/src/helpers/dto/border_radius.dto.dart';
import 'package:mix/src/helpers/dto/box_shadow.dto.dart';
import 'package:mix/src/helpers/dto/color.dto.dart';
import 'package:mix/src/helpers/dto/double.dto.dart';
import 'package:mix/src/helpers/dto/edge_insets.dto.dart';
import 'package:mix/src/helpers/dto/radius_dto.dart';
import 'package:mix/src/helpers/dto/text_style.dto.dart';

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

const borderSide = BorderSideDto.only(
  color: Color(0xFF000000),
  style: BorderStyle.solid,
  width: 1,
);

const baseBoxAttributes = BoxAttributes(
  border: BorderDto.fromBorderSide(borderSide),
  borderRadius: BorderRadiusDto.only(
    topLeft: RadiusDto.circular(DoubleDto.from(20)),
    topRight: RadiusDto.circular(DoubleDto.from(20)),
    bottomLeft: RadiusDto.circular(DoubleDto.from(20)),
    bottomRight: RadiusDto.circular(DoubleDto.from(20)),
  ),
  color: ColorDto.from(Colors.red),
  margin: EdgeInsetsDto.all(DoubleDto.from(20)),
  padding: EdgeInsetsDto.all(DoubleDto.from(20)),
  minWidth: DoubleDto.from(50),
  width: DoubleDto.from(100),
  maxWidth: DoubleDto.from(250),
  minHeight: DoubleDto.from(50),
  height: DoubleDto.from(150),
  maxHeight: DoubleDto.from(200),
  alignment: Alignment.center,
  shape: BoxShape.rectangle,
  transform: null,
  boxShadow: [
    BoxShadowDto(
      color: Colors.black,
      blurRadius: 10,
      offset: Offset(10, 10),
    ),
  ],
);

const baseTextAttributes = TextAttributes(
  textAlign: TextAlign.center,
  textScaleFactor: DoubleDto.from(1),
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  locale: Locale('en', 'US'),
  textWidthBasis: TextWidthBasis.parent,
  textHeightBehavior: TextHeightBehavior(),
  style: TextStyleDto(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontFamily: 'Roboto',
    decoration: TextDecoration.none,
    decorationColor: Colors.black,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 1,
    debugLabel: '',
    shadows: [
      Shadow(
        color: Colors.black,
        offset: Offset(10, 10),
        blurRadius: 10,
      ),
    ],
  ),
);
