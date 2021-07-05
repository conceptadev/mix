import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/widgets/primitives/box.dart';

class DirectionalTestWidget extends StatelessWidget {
  const DirectionalTestWidget({
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

class BoxInsideFlexWidget extends StatelessWidget {
  const BoxInsideFlexWidget(this.mix);

  final Mix mix;

  @override
  Widget build(BuildContext context) {
    return DirectionalTestWidget(
      child: Column(
        children: [
          Box(
            mix,
            child: SizedBox(
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
  const BoxTestWidget(this.mix);

  final Mix mix;

  @override
  Widget build(BuildContext context) {
    return DirectionalTestWidget(
      child: Box(
        mix,
        child: SizedBox(
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}
