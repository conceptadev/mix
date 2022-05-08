import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class HeadlessCardX extends StatelessWidget {
  const HeadlessCardX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = CardX(
      children: [
        TextMix(
          'Lorem ipsum dolor sit amet, consectetur',
          variant: title,
        ),
        TextMix(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
          ' Sed hendrerit risus a neque maximus, non viverra',
          variant: paragraph,
        ),
      ],
    );

    return card;
  }
}
