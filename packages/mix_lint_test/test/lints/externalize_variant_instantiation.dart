import 'package:mix/mix.dart';

final style = Style(
  // expect_lint: mix_externalize_variant_instantiation
  Variant('a')(
    // expect_lint: mix_externalize_variant_instantiation
    Variant('b')(),
  ),
);

final a = Variant('a');
final b = Variant('b');

final otherStyle = Style(
  a(
    b(),
  ),
);
