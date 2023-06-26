import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mix/mix.dart';

class BasicExample extends HookWidget {
  const BasicExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = StyleMix.fromAttributes([
      height(100),
      width(100),
      rounded(10),
      animation(),
      elevation(2),
      backgroundColor(Colors.purple),
      alignment(Alignment.center),
      textStyle(color: Colors.white),
      onPress(
        backgroundColor(Colors.black),
      ),
      onHover(
        opacity(0.5),
      ),
      onLongPress(
        backgroundColor(Colors.green),
      ),
    ]);

    final onSurfaceMix = StyleMix(
      textStyle(color: Colors.black),
    );

    return GridView.extent(
      maxCrossAxisExtent: 200,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        Pressable(
          onPressed: () {
            return;
          },
          child: StyledContainer(
            style: mix,
            child: StyledText(
              'Pressable StyledContainer',
              style: mix,
            ),
          ),
        ),
        Box(
          style: mix,
          child: StyledText(
            'Box',
            style: mix,
          ),
        ),
        StyledFlex(
          style: mix,
          direction: Axis.vertical,
          children: [
            StyledText(
              'This is such',
              style: onSurfaceMix,
            ),
            StyledText(
              'a cool flex!',
              style: onSurfaceMix,
            ),
            StyledText(
              'It\'s snowing!',
              style: onSurfaceMix,
            ),
            StyledFlex(
              direction: Axis.horizontal,
              style: mix.merge(StyleMix(
                mainAxisAlignment(MainAxisAlignment.center),
              )),
              children: [
                StyledIcon(
                  Icons.ac_unit,
                  style: StyleMix(),
                ),
                StyledIcon(
                  Icons.ac_unit,
                  style: StyleMix(),
                ),
                StyleMix().icon(
                  Icons.ac_unit,
                ),
                StyleMix().icon(
                  Icons.ac_unit,
                ),
              ],
            ),
            StyledContainer(
              style: mix,
            ),
          ],
        ),
      ],
    );
  }
}
