import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/icon/icon_size.dart';
import 'package:mix/src/widgets/text.dart';

final defaultColor = textColor(Colors.black);
final darkDefaultColor = dark(textColor(Colors.white));
const attributeConst = [IconSizeAttribute(12)];
const mixConst = Mix.builder(attributeConst);

final regular = Mix(
  defaultColor,
  darkDefaultColor,
  fontFamily('Roboto'),
);

final bold = regular.mix(fontWeight.bold);

final primary = textColor(Colors.blue);
final darkPrimary = dark(textColor(Colors.yellow));
final secondary = textColor(Colors.lime);
final darkSecondary = dark(textColor(Colors.yellow));

// ignore: avoid_classes_with_only_static_members
class DST {
  /// Basic typography
  static Mix heading1 = bold.mix(fontSize(48));
  static Mix heading2 = bold.mix(fontSize(37));
  static Mix heading3 = bold.mix(fontSize(31));
  static Mix heading4 = bold.mix(fontSize(26));
  static Mix heading5 = bold.mix(fontSize(21));
  static Mix body = regular.mix(fontSize(18), textHeight(1.2));
  static Mix small = regular.mix(fontSize(16));
  static Mix caption = regular.mix(fontSize(14));

  /// Input & Buttons
  static Mix input = regular.mix(fontSize(18));
  static Mix button = regular.mix(fontSize(21));
}

class PreviewTypography extends StatelessWidget {
  /// Constructor
  const PreviewTypography({
    Key? key,
    this.active = false,
  }) : super(key: key);

  final bool active;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextBox(
          DST.heading1,
          text: 'Heading 1',
        ),
        DST.heading1.text('Heading 1'),
        DST.heading2.text('Heading 2'),
        DST.heading3.text('Heading 3'),
        DST.heading4.text('Heading 4'),
        DST.heading5.text('Heading 5'),
        DST.body.text('Body'),
        DST.small.text('Small'),
        DST.caption.text('Caption'),
        DST.input.text('Input'),
        DST.button.text('Button'),
      ],
    );
  }
}
