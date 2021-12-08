import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/dto/border.dto.dart';
import 'package:mix/src/dto/border_radius.dto.dart';
import 'package:mix/src/dto/box_shadow.dto.dart';
import 'package:mix/src/dto/edge_insets.dto.dart';

class MixTestWidget extends StatelessWidget {
  const MixTestWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MixTheme(
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
    return MixTestWidget(
      child: Column(
        children: [
          Box(
            mix: mix,
            child: const SizedBox(
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class BoxTestWidget extends StatelessWidget {
  const BoxTestWidget(this.mix, {Key? key}) : super(key: key);

  final Mix mix;

  @override
  Widget build(BuildContext context) {
    return MixTestWidget(
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
    topLeft: 20,
    topRight: 20,
    bottomLeft: 20,
    bottomRight: 20,
  ),
  color: Colors.red,
  margin: EdgeInsetsDto.all(10),
  padding: EdgeInsetsDto.all(20),
  minWidth: 0,
  width: 100,
  maxWidth: 250,
  minHeight: 50,
  height: 150,
  maxHeight: 200,
  alignment: Alignment.center,
  shape: BoxShape.rectangle,
  transform: null,
  boxShadow: [
    BoxShadowDto(
      color: Colors.black,
      blurRadius: 10,
      offset: Offset(10, 10),
    )
  ],
);

const baseTextAttributes = TextAttributes(
  textAlign: TextAlign.center,
  textScaleFactor: 1,
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  locale: Locale('en', 'US'),
  textWidthBasis: TextWidthBasis.parent,
  textHeightBehavior: TextHeightBehavior(),
  style: TextStyle(
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
