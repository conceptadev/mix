import 'package:flutter_test/flutter_test.dart';
import 'package:remix/components/badge/badge.dart';

import '../../utils/golden_tests/golden_test_utils.dart';

void main() {
  testWidgets('Badge renders correctly', (tester) async {
    goldenTest(
      tester,
      {
        'content': ['1', 'new'],
        'size': BadgeSize.values,
        'variant': BadgeVariant.values,
      },
      builder: (params) => RxBadge(
        label: params['content'],
        size: params['size'],
        variant: params['variant'],
      ),
    );
  });
}
