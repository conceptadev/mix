import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'button_preview.dart';

class PressablePreview extends StatelessWidget {
  const PressablePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = Mix(
      rounded(35),
      animated(),
      scale(1),
      padding(20),
      elevation(8),
      bgColor($primary),
      font(
        weight: FontWeight.bold,
        color: $onBackground,
      ),
      border(
        color: Colors.black,
        width: 3,
      ),
      dark(
        border(color: Colors.white),
        textColor(Colors.white),
      ),
      hover(
        // bgColor(Colors.green.shade600),
        textColor(Colors.white),
        border(color: Colors.greenAccent),
      ),
      press(
        elevation(1),
        scale(0.9),
      ),
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          Pressable(
            mix: mix,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialogX(
                    content: const [
                      TextMix('Are you absolutely sure?', variant: title),
                      TextMix(
                        'This action cannot be undone. This will permanently delete your account and remove your data from our servers.',
                        variant: paragraph,
                      ),
                    ],
                    actions: [
                      button(
                        child: const TextMix('Cancel'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      button(
                        child: const TextMix('Yes, delete account'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const TextMix(
              'Simple Text',
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
