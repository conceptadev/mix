import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class AlertDialogX extends RemixableWidget {
  const AlertDialogX({
    Key? key,
    Mix? mix,
    required this.content,
    this.actions,
  }) : super(mix, key: key);

  final List<Widget> content;

  final List<Widget>? actions;

  @override
  Mix<Attribute> get defaultMix {
    return Mix(
      margin(20),
      elevation(6),
      rounded(10),
      padding(20),
      gap(10),
      crossAxis(CrossAxisAlignment.start),
      mainAxisSize(MainAxisSize.min),
      maxW(500.0),
      bgColor($surface),
      paragraph(
        textStyle($body1),
      ),
      title(
        titleCase(),
        textStyle($subtitle1.copyWith(fontSize: 20.0)),
        font(
          weight: FontWeight.bold,
        ),
      ),
      paragraph(
        textStyle($body1.copyWith(color: Colors.grey.shade700, fontSize: 16.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: VBox(
        mix: mix,
        children: [
          ...content,
          if (actions != null)
            HBox(
              mix: Mix(
                mainAxis(MainAxisAlignment.end),
                gap(10.0),
              ),
              children: actions!,
            ),
        ],
      ),
    );
  }
}
