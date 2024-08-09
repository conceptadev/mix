import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

import '../../utils/golden_tests/golden_test_utils.dart';

void main() {
  testWidgets('Button renders correctly', (tester) async {
    goldenTest(
      tester,
      {
        'color': [
          $box.color.red(),
          $box.color.$accent(),
        ],
      },
      builder: (params) => Box(
        style: Style(
          params['color'],
          $box.height(200),
          $box.width(200),
          $box.borderRadius(40),
        ),
      ),
    );
  });
}
