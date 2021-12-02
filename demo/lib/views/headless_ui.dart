import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mix/mix.dart';

class HeadlessPreview extends HookWidget {
  const HeadlessPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final active = useState(false);

    final rootX = Mix(
      bgColor(Colors.grey),
      'active'.variant(
        bgColor(Colors.green),
      ),
    );

    final thumbX = Mix(
      'active'.variant(
        bgColor(Colors.white54),
      ),
    );
    return Column(
      children: [
        // SwitchRemix(
        //   active: active.value,
        //   onChanged: (value) => active.value = value,
        //   thumb: SwitchRemix.Thumb(thumbX),
        // ),
        const SizedBox(height: 20),
        // RadioButtonRemix(
        //   checked: active.value,
        //   onChanged: (value) => active.value = value,
        // ),
        const SizedBox(height: 20),
        CheckboxRemix(
          checked: active.value,
          onChanged: (value) => active.value = value,
        ),
      ],
    );
  }
}
