import 'package:mix/mix.dart';

// expect_lint: mix_avoid_empty_style
final case_1 = Style();

final case_2 = Style(
  $box.color.red(),
).merge(
  // expect_lint: mix_avoid_empty_style
  Style(),
);

final case_3 = Style(
  $box.color.red(),

  // expect_lint: mix_avoid_empty_style
  Style()(),

// expect_lint: mix_avoid_empty_style
  Style.asAttribute(),
);
