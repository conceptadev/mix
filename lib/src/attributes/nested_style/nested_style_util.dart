import '../../factory/style_mix.dart';
import 'nested_style_attribute.dart';

const apply = NestedStyleUtility();

/// A utility class for creating and applying nested styles.
///
/// The `NestedStyleUtility` provides methods to create `NestedStyleAttribute`
/// instances by combining multiple `Style` objects. It allows for easy
/// composition and nesting of styles.
///
/// Usage:
///
/// ```dart
/// const apply = NestedStyleUtility();
///
/// // Create a nested style attribute from a list of styles
/// final nestedStyle = apply.list([style1, style2, style3]);
///
/// // Create a nested style attribute from individual styles
/// final nestedStyle = apply(style1, style2, style3);
/// ```
class NestedStyleUtility {
  /// Creates a new instance of `NestedStyleUtility`.
  const NestedStyleUtility();

  /// Combines a list of styles into a single `NestedStyleAttribute`.
  ///
  /// The [mixes] parameter is a list of `Style` objects to be combined.
  /// Returns a new `NestedStyleAttribute` instance representing the combined styles.
  NestedStyleAttribute _applyStyle(List<Style> mixes) {
    return NestedStyleAttribute(Style.combine(mixes));
  }

  /// Creates a `NestedStyleAttribute` from a list of styles.
  ///
  /// The [mixes] parameter is a list of `Style` objects to be combined.
  /// Returns a new `NestedStyleAttribute` instance representing the combined styles.
  NestedStyleAttribute list(List<Style> mixes) {
    return _applyStyle(mixes);
  }

  /// Creates a `NestedStyleAttribute` from individual styles.
  ///
  /// The [style] parameter is the first `Style` object to be included.
  /// The optional parameters [style2] to [style6] are additional `Style` objects
  /// that can be included in the nested style.
  ///
  /// Returns a new `NestedStyleAttribute` instance representing the combined styles.
  NestedStyleAttribute call(
    Style style, [
    Style? style2,
    Style? style3,
    Style? style4,
    Style? style5,
    Style? style6,
  ]) {
    final styles = [style, style2, style3, style4, style5, style6]
        .whereType<Style>()
        .toList();

    return _applyStyle(styles);
  }
}
