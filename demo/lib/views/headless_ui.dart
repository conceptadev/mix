import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mix/mix.dart';

class HeadlessPreview extends HookWidget {
  const HeadlessPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final active = useState(false);
    return SingleChildScrollView(
      child: Column(
        children: [
          SwitchRemix(
            checked: active.value,
            onChanged: (value) => active.value = value,
            mix: Mix(squared()),
            thumbMix: Mix(squared()),
          ),
        ],
      ),
    );
  }
}
