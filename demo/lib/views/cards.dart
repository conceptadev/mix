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
            zAligmnent(Alignment.center),
            m(12.0),
            r(10.0),
            elevation(6),
          ),
          children: [
            Box(mix: Mix(h(50), w(50), bgColor(Colors.white))),
            Box(mix: Mix(h(40), w(40), bgColor(Colors.red))),
            Box(mix: Mix(h(30), w(30), bgColor(Colors.black))),
            Box(mix: Mix(h(20), w(20), bgColor(Colors.amber))),
            Box(mix: Mix(h(10), w(10), bgColor(Colors.green))),
          ],
        ),
      ],
    );
  }
}
