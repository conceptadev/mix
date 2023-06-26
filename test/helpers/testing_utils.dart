import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

export 'package:mix/src/extensions/helper_ext.dart';

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

  final StyleMix mix;

  @override
  Widget build(BuildContext context) {
    return TestMixWidget(
      child: Column(
        children: [
          StyledContainer(
            style: mix,
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

  final StyleMix mix;

  @override
  Widget build(BuildContext context) {
    return TestMixWidget(
      child: StyledContainer(
        style: mix,
        child: const SizedBox(
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}
