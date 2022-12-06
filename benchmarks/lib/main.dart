import 'context.dart' as context_bench;
import 'factoring.dart' as factoring_bench;
import 'values.dart' as values_bench;

/// flutter run -d windows --release
void main() {
  context_bench.main();
  factoring_bench.main();
  values_bench.main();
}
