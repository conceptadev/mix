import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../mixer/mix_context.dart';
import '../../mixer/mix_factory.dart';
import '../../variants/variant.dart';
import '../mixable.widget.dart';
import '../nothing.widget.dart';
import 'text_directives/text_directive.attributes.dart';
import 'text_directives/text_directive_helpers.dart';

/// _Mix_ corollary to Flutter _Text_ widget
/// Use wherever you would use a Flutter _Text_ widget
///
/// ## Attributes:
/// - [TextAttributes](TextAttributes-class.html)
/// - [TextDirectiveAttribute](TextDirectiveAttribute-class.html)
/// - [SharedAttributes](SharedAttributes-class.html)
/// ## Utilities:
/// - [TextUtility](TextUtility-class.html)
/// - [TextStyleUtility](TextStyleUtility-class.html)
/// - [TextDirectiveUtils](TextDirectiveUtils-class.html)
/// - [SharedUtils](SharedUtils-class.html)
/// {@category Mixable Widgets}
class TextMix extends MixableWidget {
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
    return TextMixerWidget(
      createMixContext(context),
      text: text,
    );
  }
}

/// @nodoc
class TextMixerWidget extends MixedWidget {
  const TextMixerWidget(
    MixContext mixContext, {
    Key? key,
    required this.text,
  }) : super(mixContext, key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final props = mixContext.textProps;

    final directives = mixContext.directivesOfType<TextDirectiveAttribute>();

    final sharedProps = mixContext.sharedProps;
    if (!sharedProps.visible) {
      return const Nothing();
    }
    final content = applyTextDirectives(text, directives);

    if (sharedProps.animated) {
      return AnimatedDefaultTextStyle(
        style: props.style ??
            Theme.of(context).textTheme.bodyText1 ??
            const TextStyle(),
        duration: sharedProps.animationDuration,
        curve: sharedProps.animationCurve,
        softWrap: props.softWrap,
        overflow: props.overflow,
        textAlign: props.textAlign,
        maxLines: props.maxLines,
        child: Text(
          content,
          textDirection: sharedProps.textDirection,
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
        textDirection: sharedProps.textDirection,
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
      DiagnosticsProperty<MixContext>(
        'mixer',
        mixContext,
        defaultValue: null,
      ),
    );
  }
}
