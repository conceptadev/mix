import 'package:mix/mix.dart';

final ordered = Style(
  $box.color.red(),
  $box.borderRadius(3),
  $flex.gap(3),
  $flex.row(),
  $icon.size(3),
  $icon.fill(3),
  $text.style.color.red(),
  $text.style.fontSize(3),
);

// expect_lint: mix_order_attributes_in_style
final outOrder = Style(
  $box.color.red(),
  $flex.gap(3),
  $box.borderRadius(3),
);

// expect_lint: mix_order_attributes_in_style
final outOrder_2 = Style(
  $box.color.red(),
  $flex.gap(3),
  $box.borderRadius(3),
);

final a = Variant('a');
final b = Variant('b');
final c = Variant('c');

final outOrder_3 = Style(
// expect_lint: mix_order_attributes_in_style
  a(
    $box.color.red(),
    $flex.gap(3),
    $box.borderRadius(3),
  ),
);

final outOrder_4 = Style(
  a(
// expect_lint: mix_order_attributes_in_style
    b(
      $box.color.red(),
      $flex.gap(3),
      $box.borderRadius(3),
    ),
  ),
);

final outOrder_5 = Style(
// expect_lint: mix_order_attributes_in_style
  a(
    $box.color.red(),
// expect_lint: mix_order_attributes_in_style
    c(
      $box.color.red(),
      $flex.gap(3),
      $box.borderRadius(3),
    ),
    $box.borderRadius(3),
// expect_lint: mix_order_attributes_in_style
    b(
      $box.color.red(),
      $flex.gap(3),
      $box.borderRadius(3),
    ),
  ),
).applyVariant(a, b);
