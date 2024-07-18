import 'package:collection/collection.dart';
import 'package:custom_lint_core/custom_lint_core.dart';
import 'package:mix_lint/src/lints/attributes_ordering.dart';
import 'package:test/test.dart';

import '../../../utils/golden.dart';

void main() {
  testGolden(
    'Test for attributes_ordering fix',
    'lints/attributes_ordering/fix/attributes_ordering.diff',
    sourcePath: 'test/lints/attributes_ordering/fix/attributes_ordering.dart',
    (result) async {
      final lint = AttributesOrdering();
      final fix = lint.getFixes().single as DartFix;

      final errors = await lint.testRun(result);
      expect(errors, hasLength(7));

      final changes = await Future.wait([
        for (final error in errors) fix.testRun(result, error, errors),
      ]);

      return changes.flattened;
    },
  );
}
