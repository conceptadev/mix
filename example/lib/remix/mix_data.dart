import 'package:example/remix/design_tokens/colors.dart';
import 'package:example/remix/design_tokens/shadows.dart';
import 'package:example/remix/design_tokens/typography.dart';
import 'package:mix/mix.dart';

class GlobalMix extends MixData {
  static RxColors get colors => RxColors();
  static RxShadows get shadows => RxShadows();
  static RxTypography get typography => RxTypography();
}
