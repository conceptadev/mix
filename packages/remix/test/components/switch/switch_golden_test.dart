import 'package:flutter_test/flutter_test.dart';
import 'package:remix/remix.dart';

import '../../utils/golden_tests/golden_test_utils.dart';

void main() {
  testWidgets('Radio renders correctly', (tester) async {
    goldenTest(
      tester,
      {
        'value': [true, false],
        'size': SwitchSize.values,
        'variant': SwitchVariant.values,
        'disabled': [true, false],
      },
      builder: (params) => RxSwitch(
        value: params['value'],
        size: params['size'],
        variant: params['variant'],
        disabled: params['disabled'],
        onChanged: (_) {},
      ),
    );
  });
}
