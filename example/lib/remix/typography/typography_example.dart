import 'package:example/remix/components/atoms/button/button.dart';
import 'package:example/remix/components/atoms/card.dart';
import 'package:example/remix/mix_data.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

const category = "Global News";

const heading =
    "The concept of the design cycle is understood as a circular time structure";
const bodyText =
    "A design approach is a general philosophy that may or may not include a guide for specific methods. Some are to guide the overall goal of the design. Other approaches are to guide the tendencies of the designer. A combination of approaches may be used if they don't conflict.";

const readMore = 'Read full article...';

class TypographyExample extends StatelessWidget {
  const TypographyExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = GlobalMix.typography;

    return SingleChildScrollView(
      child: RmxCard(
        child: ColumnBox(
          Mix(crossAxis.start, gap(16)),
          children: [
            text.overline.text(category),
            text.h5.text(heading),
            text.body2.text(bodyText),
            text.caption.text(readMore),
            RemixButton(
              label: 'Button',
              onPressed: () {},
            ),
            RemixButton(
              icon: Icons.check,
              label: 'Button',
              onPressed: () {},
            ),
            RemixOutlinedButton(
              icon: Icons.close,
              label: 'Button',
              onPressed: () {},
            ),
            RemixTextButton(
              icon: Icons.circle,
              label: 'Button',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
