import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/widgets/box.widget.dart';

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
            mix,
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
        mix,
        child: const SizedBox(
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}
