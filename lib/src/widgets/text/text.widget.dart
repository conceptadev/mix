import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../attributes/common/common.descriptor.dart';
import '../../mixer/mix_factory.dart';
import '../../variants/variant.dart';
import '../empty.widget.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import 'text.descriptor.dart';

class TextMix extends MixWidget {
  const TextMix(
    this.text, {
    Mix? mix,
    Key? key,
    List<Variant>? variants,
    this.semanticsLabel,
    bool inherit = true,
  }) : super(
          mix,
          inherit: inherit,
          variants: variants,
          key: key,
        );

  final String text;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return MixContextBuilder(
      mix: mix,
      builder: (context, _) {
        final textProps = TextDescriptor.fromContext(context);
        final commonProps = CommonDescriptor.fromContext(context);

        return TextMixedWidget(
          textProps: textProps,
          commonProps: commonProps,
          text: text,
          semanticsLabel: semanticsLabel,
        );
      },
    );
  }
}

// TODO: Rename this to TextMixerWidget for something more descriptive
class TextMixedWidget extends StatelessWidget {
  const TextMixedWidget({
    required this.textProps,
    required this.commonProps,
    required this.text,
    Key? key,
    this.semanticsLabel,
  }) : super(key: key);

  final String text;
  final TextDescriptor textProps;
  final CommonDescriptor commonProps;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    if (!commonProps.visible) {
      return const Empty();
    }
    final content = textProps.applyTextDirectives(text);

    final textWidget = Text(
      content,
      textDirection: commonProps.textDirection,
      textWidthBasis: textProps.textWidthBasis,
      textScaleFactor: textProps.textScaleFactor,
      locale: textProps.locale,
      maxLines: textProps.maxLines,
      overflow: textProps.overflow,
      softWrap: textProps.softWrap,
      strutStyle: textProps.strutStyle,
      style: textProps.style,
      textAlign: textProps.textAlign,
      textHeightBehavior: textProps.textHeightBehavior,
      semanticsLabel: semanticsLabel,
    );

    if (commonProps.animated) {
      return AnimatedDefaultTextStyle(
        style: textProps.style ??
            Theme.of(context).textTheme.bodyText1 ??
            const TextStyle(),
        duration: commonProps.animationDuration,
        curve: commonProps.animationCurve,
        softWrap: textProps.softWrap,
        overflow: textProps.overflow,
        textAlign: textProps.textAlign,
        maxLines: textProps.maxLines,
        child: textWidget,
      );
    } else {
      return textWidget;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<String>(
        'text',
        text,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextDescriptor>(
        'props',
        textProps,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<CommonDescriptor>(
        'commonProps',
        commonProps,
        defaultValue: null,
      ),
    );
  }
}
