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
      children: [
        CardX(
          mix: Mix(
            // If true, bgColor is white
            (true)(
              bgColor(Colors.blue),
            ),
          ),
          children: [
            const TextMix(
              titleContent,
              variant: title,
            ),
            const TextMix(
              paragraphContent,
              variant: paragraph,
            ),
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
        ),
        ZBox(
          mix: Mix(
            h(100),
            w(100),
            bgColor(Colors.blue),
            align(Alignment.center),
            zAligmnent(Alignment.center),
          ),
          children: [
            Container(height: 30, width: 30, color: Colors.black),
            Container(height: 20, width: 20, color: Colors.amber),
          ],
        ),
      ],
    );
  }
}
