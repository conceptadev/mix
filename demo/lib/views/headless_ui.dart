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
        elevation(5),
      ),
    );

    final thumbX = Mix(
      'active'.variant(
        bgColor(Colors.white54),
      ),
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          SwitchX(
            active: active.value,
            onChanged: (value) => active.value = value,
            root: SwitchX.Root(rootX),
            thumb: SwitchX.Thumb(thumbX),
          ),
        ],
      ),
    );
  }
}
