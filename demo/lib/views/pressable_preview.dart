import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'button_preview.dart';

class PressablePreview extends StatefulWidget {
  const PressablePreview({Key? key}) : super(key: key);

  @override
  State<PressablePreview> createState() => _PressablePreviewState();
}

class _PressablePreviewState extends State<PressablePreview> {
  bool _enabled = false;

  @override
  Widget build(BuildContext context) {
    final mix = Mix(
      rounded(35),
      animated(),
      scale(1),
      padding(20),
      elevation(8),
      bgColor(MaterialTokens.colorScheme.primary),
      font(
        weight: FontWeight.bold,
        color: MaterialTokens.colorScheme.onBackground,
      ),
      border(
        color: Colors.black,
        width: 3,
      ),
      dark(
        border(color: Colors.white),
        textColor(Colors.white),
      ),
      // could be `hover & enabled`
      (hover & not(disabled))(
        textColor(Colors.white),
        borderColor(Colors.greenAccent),
      ),
      press(
        elevation(1),
        scale(0.9),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwitchX(
              checked: _enabled,
              onChanged: (v) => setState(() => _enabled = v),
            ),
            const SizedBox(width: 5.0),
            Text(_enabled ? 'Enabled' : 'Disabled'),
          ],
        ),
        Pressable(
          onPressed: _enabled
              ? () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogX(
                        content: [
                          TextMix(
                            'Are you absolutely sure?',
                            variants: [title],
                          ),
                          TextMix(
                            'This action cannot be undone. '
                            'This will permanently delete your account and remove '
                            'your data from our servers.',
                            variants: [paragraph],
                          ),
                        ],
                        actions: [
                          button(
                            child: const TextMix('Cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            overrideMix: Mix(
                              textColor(Colors.grey.shade700),
                              bgColor(Colors.grey.shade400),
                              (hover)(
                                bgColor(Colors.grey),
                              ),
                            ),
                          ),
                          button(
                            child: const TextMix('Yes, delete account'),
                            onPressed: Navigator.of(context).pop,
                            overrideMix: Mix(
                              textColor(Colors.red.shade100),
                              bgColor(Colors.redAccent.shade200),
                              (hover)(
                                bgColor(Colors.redAccent.shade400),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              : null,
          child: Box(
            mix: mix,
            child: const TextMix('Simple Text'),
          ),
        ),
      ],
    );
  }
}
