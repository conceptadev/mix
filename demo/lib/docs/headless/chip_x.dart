import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class HeadlessChipX extends StatelessWidget {
  const HeadlessChipX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardX(
      children: [
        Row(children: [
          ChipX(
            children: const [IconMix(Icons.add), TextMix('Lorem')],
            onPressed: () => debugPrint('lorem'),
          ),
          const ChipX(children: [TextMix('Ipsum')]),
          const ChipX(children: [TextMix('Dolor')]),
          const ChipX(children: [TextMix('Sit')]),
          const ChipX(children: [TextMix('Amet')]),
        ]),
      ],
    );
  }
}
