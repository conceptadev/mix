## 3.2.12

## 0.1.0

- Initial version.
- Introduces lint rules for:
  - (mix_attributes_ordering) Ordering attributes in `Style` constructor;
  - (mix_avoid_empty_variants) Avoiding empty variants;
  - (mix_avoid_variant_inside_context_variant) use of variant inside `ContextVariant`;
  - (mix_avoid_defining_tokens_or_variants_within_style) Preventing `Variant` and `MixToken` instantiation inside `Style` constructors;
  - (mix_avoid_defining_tokens_within_theme_data) Avoiding `Token` creation inside `MixThemeData`;
  - (mix_max_number_of_attributes_per_style) Limiting the number of attributes per `Style`;