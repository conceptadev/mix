import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

Mix get heading {
  return Mix(
    titleCase(),
    font(
      color: cs().onSurface,
    ),
  );
}

Mix get card {
  return Mix(
    margin(20),
    elevation(6),
    rounded(10),
    bgColor(cs().surface),
    padding(20),
    gap(10),
    crossAxis(CrossAxisAlignment.start),
  );
}

class CardsPreview extends StatelessWidget {
  const CardsPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final mix = Mix(
    //   margin(20),
    //   elevation(6),
    //   rounded(10),
    //   bgColor(cs().surface),
    //   width(100),
    //   padding(20),
    //   titleCase(),
    //   gap(10),
    //   crossAxis(CrossAxisAlignment.start),
    // );

    return SingleChildScrollView(
      child: card.vbox(
        children: const [
          TextMix('This is a title'),
          TextMix(
            'This is great content that I add here when I need something awesome',
          ),
        ],
      ),
    );
  }
}
