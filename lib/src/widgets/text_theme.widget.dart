import 'package:flutter/material.dart';

import '../attributes/exports.dart';
import '../mixer/mix_factory.dart';
import '../theme/refs/text_style_ref.dart';
import '../theme/tokens/text_theme_tokens.dart';
import 'mixable.widget.dart';
import 'text.widget.dart';

class BaseType extends RemixableWidget {
  const BaseType(
    this.text, {
    required this.textStyleRef,
    Mix? mix,
    Key? key,
  }) : super(mix, key: key);

  final String text;
  final TextStyleRef textStyleRef;

  @override
  get defaultMix {
    return Mix(
      textStyle(textStyleRef),
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
          textStyleRef: $headline1,
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
          textStyleRef: $headline2,
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
          textStyleRef: $headline3,
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
          textStyleRef: $headline4,
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
          textStyleRef: $headline5,
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
          textStyleRef: $headline6,
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
          textStyleRef: $subtitle1,
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
          textStyleRef: $subtitle2,
          mix: mix,
          key: key,
        );
}

class Body1 extends BaseType {
  const Body1(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleRef: $body1,
          mix: mix,
          key: key,
        );
}

class Body2 extends BaseType {
  const Body2(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          textStyleRef: $body2,
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
          textStyleRef: $caption,
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
          textStyleRef: $button,
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
          textStyleRef: $overline,
          mix: mix,
          key: key,
        );
}
