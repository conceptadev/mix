import 'package:flutter_test/flutter_test.dart';
import 'package:remix/components/progress/progress.dart';

import '../../utils/golden_tests/golden_test_utils.dart';

void main() {
  testWidgets('Button renders correctly', (tester) async {
    goldenTest(
      tester,
      {
        'value': [0.0, 0.5, 1.0],
        'size': ProgressSize.values,
        'variant': ProgressVariant.values,
        'radius': ProgressRadius.values,
      },
      builder: (params) => RxProgress(
        value: params['value'],
        size: params['size'],
        variant: params['variant'],
        radius: params['radius'],
      ),
    );
  });
}
