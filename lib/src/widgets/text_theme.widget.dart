import 'package:flutter/material.dart';

import '../attributes/exports.dart';
import '../mixer/mix_factory.dart';
import '../theme/material_theme/text_theme_tokens.dart';
import '../theme/refs/text_style_token.dart';
import 'mixable.widget.dart';
import 'text.widget.dart';

class BaseType extends RemixableWidget {
  const BaseType(
    this.text, {
    required this.textStyleToken,
    Mix? mix,
    Key? key,
  }) : super(mix, key: key);

  final String text;
  final TextStyleToken textStyleToken;

  @override
  get defaultMix {
    return Mix(
      textStyle(textStyleToken),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextMix(text, mix: mix);
  }
}

class Headline1 extends BaseType {
  const Headline1(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $headline1,
          mix: mix,
          key: key,
        );
}

class Headline2 extends BaseType {
  const Headline2(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $headline2,
          mix: mix,
          key: key,
        );
}

class Headline3 extends BaseType {
  const Headline3(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $headline3,
          mix: mix,
          key: key,
        );
}

class Headline4 extends BaseType {
  const Headline4(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $headline4,
          mix: mix,
          key: key,
        );
}

class Headline5 extends BaseType {
  const Headline5(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $headline5,
          mix: mix,
          key: key,
        );
}

class Headline6 extends BaseType {
  const Headline6(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $headline6,
          mix: mix,
          key: key,
        );
}

class Subtitle1 extends BaseType {
  const Subtitle1(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $subtitle1,
          mix: mix,
          key: key,
        );
}

class Subtitle2 extends BaseType {
  const Subtitle2(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $subtitle2,
          mix: mix,
          key: key,
        );
}

class BodyText1 extends BaseType {
  const BodyText1(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $body1,
          mix: mix,
          key: key,
        );
}

class BodyText2 extends BaseType {
  const BodyText2(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $body2,
          mix: mix,
          key: key,
        );
}

class Caption extends BaseType {
  const Caption(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $caption,
          mix: mix,
          key: key,
        );
}

class Button extends BaseType {
  const Button(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $button,
          mix: mix,
          key: key,
        );
}

class OverLine extends BaseType {
  const OverLine(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $overline,
          mix: mix,
          key: key,
        );
}

// Material 3 Typeset

class DisplaySmall extends BaseType {
  const DisplaySmall(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $displaySmall,
          mix: mix,
          key: key,
        );
}

class DisplayMedium extends BaseType {
  const DisplayMedium(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $displayMedium,
          mix: mix,
          key: key,
        );
}

class DisplayLarge extends BaseType {
  const DisplayLarge(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $displayLarge,
          mix: mix,
          key: key,
        );
}

class HeadlineSmall extends BaseType {
  const HeadlineSmall(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $headlineSmall,
          mix: mix,
          key: key,
        );
}

class HeadlineMedium extends BaseType {
  const HeadlineMedium(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $headlineMedium,
          mix: mix,
          key: key,
        );
}

class HeadlineLarge extends BaseType {
  const HeadlineLarge(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $headlineLarge,
          mix: mix,
          key: key,
        );
}

class TitleSmall extends BaseType {
  const TitleSmall(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $titleSmall,
          mix: mix,
          key: key,
        );
}

class TitleMedium extends BaseType {
  const TitleMedium(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $titleMedium,
          mix: mix,
          key: key,
        );
}

class TitleLarge extends BaseType {
  const TitleLarge(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $titleLarge,
          mix: mix,
          key: key,
        );
}

class BodySmall extends BaseType {
  const BodySmall(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $bodySmall,
          mix: mix,
          key: key,
        );
}

class BodyMedium extends BaseType {
  const BodyMedium(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $bodyMedium,
          mix: mix,
          key: key,
        );
}

class BodyLarge extends BaseType {
  const BodyLarge(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $bodyLarge,
          mix: mix,
          key: key,
        );
}

class LabelSmall extends BaseType {
  const LabelSmall(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $labelSmall,
          mix: mix,
          key: key,
        );
}

class LabelMedium extends BaseType {
  const LabelMedium(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $labelMedium,
          mix: mix,
          key: key,
        );
}

class LabelLarge extends BaseType {
  const LabelLarge(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleToken: $labelLarge,
          mix: mix,
          key: key,
        );
}
