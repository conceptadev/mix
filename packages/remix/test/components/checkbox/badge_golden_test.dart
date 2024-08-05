import 'package:flutter_test/flutter_test.dart';
import 'package:remix/components/checkbox/checkbox.dart';

import '../../utils/golden_tests/golden_test_utils.dart';

void main() {
  testWidgets('Button renders correctly', (tester) async {
    goldenTest(
      tester,
      {
        'size': CheckboxSize.values,
        'value': [true, false],
        'variant': CheckboxVariant.values,
        'disabled': [true, false],
      },
      builder: (params) => RxCheckbox(
        onChanged: (p0) {},
        size: params['size'],
        value: params['value'],
        variant: params['variant'],
        disabled: params['disabled'],
      ),
    );
  });
}
