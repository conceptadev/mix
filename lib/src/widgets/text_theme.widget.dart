import 'package:flutter/material.dart';
import 'package:mix/src/helpers/extensions.dart';

import '../attributes/exports.dart';
import '../mixer/mix_factory.dart';
import 'text.widget.dart';

abstract class TextStyleResolverWidget extends StatelessWidget {
  const TextStyleResolverWidget(
    this.text, {
    this.mix,
    Key? key,
  }) : super(key: key);

  final String text;
  final Mix? mix;

  TextStyle? resolver(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final style = Mix(
      textStyle(resolver(context)),
      apply(mix),
    );
    return TextMix(text, mix: style);
  }
}

class Headline1 extends TextStyleResolverWidget {
  const Headline1(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.headline1;
  }
}

class Headline2 extends TextStyleResolverWidget {
  const Headline2(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.headline2;
  }
}

class Headline3 extends TextStyleResolverWidget {
  const Headline3(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.headline3;
  }
}

class Headline4 extends TextStyleResolverWidget {
  const Headline4(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.headline4;
  }
}

class Headline5 extends TextStyleResolverWidget {
  const Headline5(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.headline5;
  }
}

class Headline6 extends TextStyleResolverWidget {
  const Headline6(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.headline6;
  }
}

class Subtitle1 extends TextStyleResolverWidget {
  const Subtitle1(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.subtitle1;
  }
}

class Subtitle2 extends TextStyleResolverWidget {
  const Subtitle2(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.subtitle2;
  }
}

class BodyText1 extends TextStyleResolverWidget {
  const BodyText1(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.bodyText1;
  }
}

class BodyText2 extends TextStyleResolverWidget {
  const BodyText2(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.bodyText2;
  }
}

class Caption extends TextStyleResolverWidget {
  const Caption(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.caption;
  }
}

class Button extends TextStyleResolverWidget {
  const Button(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.button;
  }
}

class OverLine extends TextStyleResolverWidget {
  const OverLine(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.overline;
  }
}

// Material 3 Typeset

class DisplaySmall extends TextStyleResolverWidget {
  const DisplaySmall(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.displaySmall;
  }
}

class DisplayMedium extends TextStyleResolverWidget {
  const DisplayMedium(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.displayMedium;
  }
}

class DisplayLarge extends TextStyleResolverWidget {
  const DisplayLarge(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.displayLarge;
  }
}

class HeadlineSmall extends TextStyleResolverWidget {
  const HeadlineSmall(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.headlineSmall;
  }
}

class HeadlineMedium extends TextStyleResolverWidget {
  const HeadlineMedium(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.headlineMedium;
  }
}

class HeadlineLarge extends TextStyleResolverWidget {
  const HeadlineLarge(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.headlineLarge;
  }
}

class TitleSmall extends TextStyleResolverWidget {
  const TitleSmall(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.titleSmall;
  }
}

class TitleMedium extends TextStyleResolverWidget {
  const TitleMedium(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.titleMedium;
  }
}

class TitleLarge extends TextStyleResolverWidget {
  const TitleLarge(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.titleLarge;
  }
}

class BodySmall extends TextStyleResolverWidget {
  const BodySmall(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.bodySmall;
  }
}

class BodyMedium extends TextStyleResolverWidget {
  const BodyMedium(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.bodyMedium;
  }
}

class BodyLarge extends TextStyleResolverWidget {
  const BodyLarge(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.bodyLarge;
  }
}

class LabelSmall extends TextStyleResolverWidget {
  const LabelSmall(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.labelSmall;
  }
}

class LabelMedium extends TextStyleResolverWidget {
  const LabelMedium(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.labelMedium;
  }
}

class LabelLarge extends TextStyleResolverWidget {
  const LabelLarge(
    String text, {
    Mix? mix,
    Key? key,
  }) : super(
          text,
          mix: mix,
          key: key,
        );

  @override
  TextStyle? resolver(BuildContext context) {
    return context.theme.textTheme.labelLarge;
  }
}
