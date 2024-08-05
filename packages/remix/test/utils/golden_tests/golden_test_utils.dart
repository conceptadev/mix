import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../extensions/widget_tester.dart';

List<Map<String, dynamic>> generateCombinations(
    Map<String, List<dynamic>> values) {
  List<Map<String, dynamic>> combinations = [{}];

  for (final key in values.keys) {
    List<Map<String, dynamic>> newCombinations = [];
    for (final value in values[key]!) {
      for (final combination in combinations) {
        newCombinations.add({...combination, key: value});
      }
    }
    combinations = newCombinations;
  }
  return combinations;
}

String generateName(Map<String, dynamic> parameters) {
  final name = <String>[];
  for (final key in parameters.keys) {
    name.add('$key:${parameters[key]}');
  }
  return name.join('_');
}

Future<void> goldenTest(
  WidgetTester tester,
  Map<String, List<dynamic>> values, {
  required Widget Function(Map<String, dynamic>) builder,
}) async {
  final allCombinations = generateCombinations(values);
  int number = 0;
  for (final parameters in allCombinations) {
    final widget = builder(parameters);
    number += 1;
    await tester.pumpRxComponent(
      Center(
        child: widget,
      ),
    );
    await tester.pumpAndSettle();

    final fileName = widget.toStringShort().toLowerCase();
    await expectLater(
      find.byType(widget.runtimeType),
      matchesGoldenFile('golden_tests/$fileName.$number.png'),
    );
  }
}
