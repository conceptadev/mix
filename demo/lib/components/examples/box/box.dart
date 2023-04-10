import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'box.mix.dart';

class BoxExample extends StatelessWidget {
  const BoxExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StyledContainer(
            style: button,
            child: const StyledText('Details'),
          ),
        ],
      ),
    );
  }
}
