import 'package:mix/mix.dart';

class TokenUtils {
  const TokenUtils._();

  static TokenRefAttribute token(String token) {
    return TokenRefAttribute(token);
  }

  static TokenRefAttribute headline1() {
    return token('headline1');
  }

  static TokenRefAttribute headline2() {
    return token('headline2');
  }

  static TokenRefAttribute headline3() {
    return token('headline3');
  }

  static TokenRefAttribute headline4() {
    return token('headline4');
  }

  static TokenRefAttribute headline5() {
    return token('headline5');
  }

  static TokenRefAttribute headline6() {
    return token('headline6');
  }

  static TokenRefAttribute subtitle1() {
    return token('subtitle1');
  }

  static TokenRefAttribute subtitle2() {
    return token('subtitle2');
  }

  static TokenRefAttribute body1() {
    return token('body1');
  }

  static TokenRefAttribute body2() {
    return token('body2');
  }

  static TokenRefAttribute button() {
    return token('button');
  }

  static TokenRefAttribute caption() {
    return token('caption');
  }

  static TokenRefAttribute overline() {
    return token('overline');
  }
}
