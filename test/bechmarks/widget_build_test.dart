import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

int expensiveFunction() {
  int result = 0;
  for (int i = 0; i < 10000000; i++) {
    result += i;
  }

  return result;
}

class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    expensiveFunction();

    return Container(
      width: 100,
      height: 100,
      color: Colors.blue,
    );
  }
}

void main() {
  testWidgets('Build time test', (WidgetTester tester) async {
    final widget = Container(width: 100, height: 100, color: Colors.blue);

    const expensiveWidget = ExpensiveWidget();

    final stopwatch = Stopwatch()..start();
    await tester.pumpWidget(widget);
    final elapsed = stopwatch.elapsedMilliseconds;

    stopwatch.reset();
    await tester.pumpWidget(expensiveWidget);
    final elapsedExpensive = stopwatch.elapsedMilliseconds;

    print('Elapsed: $elapsed');
    print('Elapsed Expensive: $elapsedExpensive');
  });
}
