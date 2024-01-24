import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class VariantsDefaultExample extends StatelessWidget {
  const VariantsDefaultExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Style(
      box.color($md.colorScheme.secondary()),
      text.style.color.of($md.colorScheme.onSecondary),
      onHover(
        box.color.of($md.colorScheme.primary),
        text.style(color: $md.colorScheme.onPrimary()),
      ),
    );

    return Center(
      child: Pressable(
        onPressed: () {
          return;
        },
        child: Box(
          style: style,
          child: const StyledText('Button'),
        ),
      ),
    );
  }
}
