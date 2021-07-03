import 'package:example/components/container_background.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class UsageExample extends StatelessWidget {
  const UsageExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ColumnBox(
          Mix(gap(20), m(20), crossAxis.start),
          children: [
            ContainerBackground(
              child: Box(
                Mix(bgColor(Colors.white), h(150), w(150), center),
                child: Text('Card'),
              ),
            ),
            ContainerBackground(
              child: Box(
                Mix(
                  bgColor(Colors.white),
                  h(150),
                  w(150),
                  p(20),
                  bottomLeft,
                  m(20),
                ),
                child: Text('Card'),
              ),
            ),
            ContainerBackground(
              child: Box(
                Mix(
                  bgColor(Colors.white),
                  h(150),
                  w(150),
                  p(20),
                  bottomLeft,
                  m(20),
                  rounded(20),
                ),
                child: Text('Card'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
