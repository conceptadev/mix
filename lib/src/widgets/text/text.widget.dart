import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../mixer/mix_factory.dart';
import '../../variants/variant.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import '../nothing.widget.dart';
import 'text.props.dart';

class TextMix extends MixWidget {
  const TextMix(
    this.text, {
    Mix? mix,
    Key? key,
    List<Variant>? variants,
    bool inherit = true,
  }) : super(
          mix,
          inherit: inherit,
          variants: variants,
          key: key,
        );

  final String text;

  @override
  Widget build(BuildContext context) {
    return MixContextBuilder(
      mix: mix,
      builder: (context, mixContext) {
        final props = TextProps.fromContext(mixContext);

        return TextMixedWidget(props, text: text);
      },
    );
  }
}

// TODO: Rename this to TextMixerWidget for something more descriptive
class TextMixedWidget extends StatelessWidget {
  const TextMixedWidget(
    this.props, {
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  final TextProps props;

  @override
  Widget build(BuildContext context) {
    if (!props.visible) {
      return const Nothing();
    }
    final content = props.applyTextDirectives(text);

    if (props.animated) {
      return AnimatedDefaultTextStyle(
        style: props.style ??
            Theme.of(context).textTheme.bodyText1 ??
            const TextStyle(),
        duration: props.animationDuration,
        curve: props.animationCurve,
        softWrap: props.softWrap,
        overflow: props.overflow,
        textAlign: props.textAlign,
        maxLines: props.maxLines,
        child: Text(
          content,
          textDirection: props.textDirection,
          textWidthBasis: props.textWidthBasis,
          textScaleFactor: props.textScaleFactor,
          locale: props.locale,
          maxLines: props.maxLines,
          overflow: props.overflow,
          softWrap: props.softWrap,
          strutStyle: props.strutStyle,
          style: props.style,
          textAlign: props.textAlign,
          textHeightBehavior: props.textHeightBehavior,
        ),
      );
    } else {
      return Text(
        content,
        softWrap: props.softWrap,
        textDirection: props.textDirection,
        textWidthBasis: props.textWidthBasis,
        textAlign: props.textAlign,
        overflow: props.overflow,
        maxLines: props.maxLines,
        textScaleFactor: props.textScaleFactor,
        style: props.style,
        locale: props.locale,
        strutStyle: props.strutStyle,
        textHeightBehavior: props.textHeightBehavior,
      );
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
      DiagnosticsProperty<TextProps>(
        'props',
        props,
        defaultValue: null,
      ),
    );
  }
}
