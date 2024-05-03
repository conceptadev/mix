import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('NestedStyleUtility', () {
    late NestedStyleUtility nestedStyleUtility;

    setUp(() {
      nestedStyleUtility = const NestedStyleUtility();
    });

    test(
        'list method should return a NestedStyleAttribute with combined styles',
        () {
      final style1 = Style($box.color.red());
      final style2 = Style($box.color.blue());
      final styles = [style1, style2];

      final result = nestedStyleUtility.list(styles);

      expect(result, isA<NestedStyleAttribute>());
      expect(result.value, equals(Style.combine(styles)));
    });

    test(
        'call method should return a NestedStyleAttribute with combined styles',
        () {
      final style1 = Style($box.color.red());
      final style2 = Style($box.color.blue());
      final style3 = Style($box.color.green());

      final result = nestedStyleUtility(style1, style2, style3);

      expect(result, isA<NestedStyleAttribute>());
      expect(result.value, equals(Style.combine([style1, style2, style3])));
    });

    test('call method should ignore null styles', () {
      final style1 = Style($box.color.red());
      final style2 = Style($box.color.blue());

      final result = nestedStyleUtility(style1, null, style2, null);

      expect(result, isA<NestedStyleAttribute>());
      expect(result.value, equals(Style.combine([style1, style2])));
    });
  });
}
