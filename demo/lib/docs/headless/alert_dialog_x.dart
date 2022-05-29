import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class HeadlessAlertDialogX extends StatelessWidget {
  const HeadlessAlertDialogX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dialog = AlertDialogX(
      content: <Widget>[
        TextMix(
          'Are you absolutely sure?',
          variants: [
            title
          ], // `title` variant used to style the TextMix as title
        ),
        TextMix(
          'This action cannot be undone. '
          'This will permanently delete your account and remove '
          'your data from our servers.',
          variants: [paragraph], // `paragraph` variant to style the TextMix as
        ),
      ],
      actions: const <Widget>[
        // your buttons come here
      ],
    );

    return dialog;
  }
}
