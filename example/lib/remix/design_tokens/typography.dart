import 'package:example/remix/design_tokens/colors.dart';
import 'package:mix/mix.dart';

class RxFontWeight {
  const RxFontWeight._();
  static get light => fontWeight.w200;
  static get normal => fontWeight.normal;
  static get bold => fontWeight.bold;
}

class RxTypography {
  get _base {
    return Mix(
      // Default font family
      fontFamily('Roboto'),
      // Default font weight
      RxFontWeight.normal,
      // Default case
      sentenceCase,
      // Default line height
      textHeight(1.4),
      // Define base color
      textColor(RxColors.black),
      // Define base color for dark mode
      // This will override the above attribute
      textColor(RxColors.white).onDark,
    );
  }

  Mix get _heading {
    return Mix(
      apply(_base),
      titleCase,
    );
  }

  Mix get h1 {
    return Mix(
      apply(_heading),
      fontSize(96),
      RxFontWeight.light,
      letterSpacing(-1.5),
    );
  }

  Mix get h2 {
    return Mix(
      apply(_heading),
      fontSize(60),
      letterSpacing(-0.5),
      RxFontWeight.light,
    );
  }

  Mix get h3 {
    return Mix(
      apply(_heading),
      fontSize(48),
      letterSpacing(0),
    );
  }

  Mix get h4 {
    return Mix(
      apply(_heading),
      fontSize(34),
      letterSpacing(0.25),
      fontWeight.bold,
    );
  }

  Mix get h5 {
    return Mix(
      apply(_heading),
      fontSize(24),
      letterSpacing(0),
      fontWeight.bold,
    );
  }

  Mix get h6 {
    return Mix(
      apply(_heading),
      fontSize(20),
      letterSpacing(0.15),
      fontWeight.bold,
    );
  }

  Mix get subtitle {
    return Mix(
      apply(_heading),
      fontSize(16),
      letterSpacing(0.15),
    );
  }

  Mix get _body {
    return Mix(
      apply(_base),
      textHeight(1.8),
      textColor(RxColors.grey.shade600),
      textColor(RxColors.grey.shade400).onDark,
    );
  }

  Mix get body1 {
    return Mix(
      apply(_body),
      fontSize(16),
      letterSpacing(0.5),
    );
  }

  Mix get body2 {
    return Mix(
      apply(_body),
      fontSize(14),
      letterSpacing(0.25),
    );
  }

  Mix get caption {
    return Mix(
      apply(_base),
      fontSize(12),
      letterSpacing(0.4),
    );
  }

  Mix get overline {
    return Mix(
      apply(_base),
      fontSize(10),
      letterSpacing(1.5),
      upperCase,
    );
  }
}
