// ignore_for_file: mix_avoid_empty_variants
import 'package:mix/mix.dart';

// Wrong case
final wrong_case_variant = Style(
  // expect_lint: mix_avoid_defining_tokens_or_variants_within_style
  Variant('a')(
    // expect_lint: mix_avoid_defining_tokens_or_variants_within_style
    Variant('b')(),
  ),
);

final wrong_case_token = Style(
  // expect_lint: mix_avoid_defining_tokens_or_variants_within_style
  $box.color.ref(ColorToken('test')),
  // expect_lint: mix_avoid_defining_tokens_or_variants_within_style
  $box.borderRadius.all.ref(RadiusToken('test')),
  // expect_lint: mix_avoid_defining_tokens_or_variants_within_style
  $box.padding.all.ref(SpaceToken('test')),
  // expect_lint: mix_avoid_defining_tokens_or_variants_within_style
  $text.style.ref(TextStyleToken('test')),
  // expect_lint: mix_avoid_defining_tokens_or_variants_within_style
  $on.breakpoint(BreakpointToken('test')())(
    // expect_lint: mix_avoid_defining_tokens_or_variants_within_style
    $box.color.ref(ColorToken('test')),
    // expect_lint: mix_avoid_defining_tokens_or_variants_within_style
    $box.borderRadius.all.ref(RadiusToken('test')),
    // expect_lint: mix_avoid_defining_tokens_or_variants_within_style
    $box.padding.all.ref(SpaceToken('test')),
    // expect_lint: mix_avoid_defining_tokens_or_variants_within_style
    $text.style.ref(TextStyleToken('test')),
  ),
);

// Correct case
final a = Variant('a');
final b = Variant('b');

final correct_case_variant = Style(
  a(
    b(),
  ),
);

final colorToken = ColorToken('test');
final radiusToken = RadiusToken('test');
final spaceToken = SpaceToken('test');
final textStyleToken = TextStyleToken('test');
final breakpointToken = BreakpointToken('test');

final correct_case_token = Style(
  $box.color.ref(colorToken),
  $box.borderRadius.all.ref(radiusToken),
  $box.padding.all.ref(spaceToken),
  $text.style.ref(textStyleToken),
  $on.breakpoint(BreakpointRef(breakpointToken))(
    $box.color.ref(colorToken),
    $box.borderRadius.all.ref(radiusToken),
    $box.padding.all.ref(spaceToken),
    $text.style.ref(textStyleToken),
  ),
);
