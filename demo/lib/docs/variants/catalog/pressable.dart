import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class VariantsCatalogPressable extends StatelessWidget {
  const VariantsCatalogPressable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      buildBlock(
        'Hover',
        StyleMix(onHover(
          border(color: $M3Color.primary, width: 2),
          padding(4.0),
        )),
        const Text('Hover this to show the highlight'),
      ),
      const VerticalDivider(),
      buildBlock(
        'Focus',
        StyleMix(onFocus(
          border(color: $M3Color.primary, width: 2),
          padding(4.0),
        )),
        const Text('Focus this to show the highlight'),
      ),
      const VerticalDivider(),
      buildBlock(
        'Press',
        StyleMix(onPress(
          border(color: $M3Color.primary, width: 2),
          padding(4.0),
        )),
        const Text('Press this to show the highlight'),
      ),
    ]);
  }

  Widget buildBlock(String title, StyleMix mix, Widget child) {
    return Builder(builder: (context) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Pressable(
                onPressed: () {
                  return;
                },
                child: StyledContainer(
                  style: mix,
                  child: child,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
