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
      const Var('active')(
        bgColor(Colors.green),
      ),
    );

    final thumbX = Mix(
      const Var('active')(
        bgColor(Colors.white54),
      ),
    );
    return Column(
      children: [
        // SwitchX(
        //   active: active.value,
        //   onChanged: (value) => active.value = value,
        //   thumb: SwitchX.Thumb(thumbX),
        // ),
        // const SizedBox(height: 20),
        // RadioButtonX(
        //   checked: active.value,
        //   onChanged: (value) => active.value = value,
        // ),
        const SizedBox(height: 20),
        CheckboxX(
          checked: active.value,
          onChanged: (value) => active.value = value,
        ),
      ],
    );
  }
}
