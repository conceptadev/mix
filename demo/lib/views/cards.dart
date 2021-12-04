import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

const title = Var('title');

const paragraph = Var('paragraph');

Mix get card {
  return Mix(
    margin(20),
    elevation(6),
    rounded(10),
    padding(20),
    gap(10),
    crossAxis(CrossAxisAlignment.start),
    bgColor($surface),
    paragraph(
      textStyle($body1),
    ),
    title(
      titleCase(),
      textStyle($h6),
      font(
        weight: FontWeight.bold,
      ),
    ),
  );
}

const titleContent = 'Lorem ipsum dolor sit amet, consectetur';
const paragraphContent =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit risus a neque maximus, non viverra nibh imperdiet. Quisque finibus mattis metus, vitae consequat neque feugiat id.';

class CardsPreview extends StatelessWidget {
  const CardsPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: card.vbox(
        children: [
          const TextMix(
            titleContent,
            variant: title,
          ),
          const TextMix(
            paragraphContent,
            variant: paragraph,
          ),
        ],
      ),
    );
  }
}
