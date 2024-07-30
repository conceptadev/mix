
import 'package:flutter_test/flutter_test.dart';
import 'package:remix/components/avatar/avatar.dart';

import '../../utils/golden_tests/golden_test_utils.dart';

void main() {
  testWidgets('MyWidget renders correctly', (tester) async {
    goldenTest(
      tester,
      {
        'fallback': [null, 'LF'], //2
        'radius': AvatarRadius.values, //5
        'size': AvatarSize.values, //8
        'variant': AvatarVariant.values, //2
      },
      builder: (params) => RxAvatar(
        fallback: params['fallback'],
        radius: params['radius'],
        size: params['size'],
        variant: params['variant'],
      ),
    );
  });
}
