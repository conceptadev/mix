import 'package:flutter_test/flutter_test.dart';
import 'package:remix/components/radio/radio.dart';

import '../../utils/golden_tests/golden_test_utils.dart';

void main() {
  testWidgets('Radio renders correctly', (tester) async {
    goldenTest(
      tester,
      {
        'value': [true, false],
        'size': RadioSize.values,
        'variant': RadioVariant.values,
        'disabled': [true, false],
      },
      fileName: 'rxradio',
      builder: (params) => RxRadio(
        value: params['value'],
        groupValue: true,
        size: params['size'],
        variant: params['variant'],
        disabled: params['disabled'],
        onChanged: (_) {},
      ),
    );
  });
}
