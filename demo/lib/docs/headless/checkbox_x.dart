import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class HeadlessCheckboxX extends StatefulWidget {
  const HeadlessCheckboxX({Key? key}) : super(key: key);

  @override
  State<HeadlessCheckboxX> createState() => _HeadlessCheckboxXState();
}

class _HeadlessCheckboxXState extends State<HeadlessCheckboxX> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CheckboxX(
          checked: checked,
          onChanged: (v) => setState(() => checked = v),
        ),
        const Divider(),
        Row(
          children: [
            const Spacer(),
            CheckboxX(checked: true, onChanged: (v) {}),
            const SizedBox(width: 4.0),
            const Text('Checked'),
            const Spacer(),
            CheckboxX(checked: false, onChanged: (v) {}),
            const SizedBox(width: 4.0),
            const Text('Unchecked'),
            const Spacer(),
            // const CheckboxX(checked: true, onChanged: null),
            // const CheckboxX(checked: false, onChanged: null),
          ],
        ),
      ],
    );
  }
}
