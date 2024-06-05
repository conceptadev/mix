import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/helpers/lerp_helpers.dart';

void main() {
  test('Linearly interpolates between two integers', () {
    int a = 10;
    int b = 20;
    double t = 0.3;
    int result = lerpInt(a, b, t);
    expect(result, 13);
  });

  test('Snaps between two values based on a threshold', () {
    String from = 'Hello';
    String to = 'World';
    double t = 0.8;
    String? result = lerpSnap(from, to, t);
    expect(result, 'World');
  });
}
