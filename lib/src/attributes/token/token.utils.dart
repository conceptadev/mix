import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';

class TokenUtils {
  const TokenUtils._();

  static TokenRefAttribute token<T extends Attribute>(Symbol token) {
    return TokenRefAttribute<T>(token);
  }
}
