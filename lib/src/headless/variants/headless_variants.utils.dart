import '../../attributes/common/attribute.dart';
import '../../variants/variants.dart';

class HeadlessVariantUtils {
  /// Short Utils: active
  static Variant<T> active<T extends Attribute>() {
    return Variant<T>('active');
  }

  /// Short Utils: inactive
  static Variant<T> inactive<T extends Attribute>() {
    return Variant<T>('inactive');
  }

  /// Short Utils: title
  static Variant<T> title<T extends Attribute>() {
    return Variant<T>('title');
  }

  /// Short Utils: paragraph
  static Variant<T> paragraph<T extends Attribute>() {
    return Variant<T>('paragraph');
  }
}
