import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

const titleContent = 'Lorem ipsum dolor sit amet, consectetur';
const paragraphContent =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit risus a neque maximus, non viverra nibh imperdiet. Quisque finibus mattis metus, vitae consequat neque feugiat id.';

class CardsPreview extends StatelessWidget {
  const CardsPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CardX(
          children: [
            TextMix(
              titleContent,
              variant: title,
            ),
            TextMix(
              paragraphContent,
              variant: paragraph,
            ),
          ],
        ),
      ],
    );
  }
}
