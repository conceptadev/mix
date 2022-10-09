import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/shared/shared.props.dart';
import 'package:mix/src/widgets/empty.widget.dart';
import 'package:mix/src/widgets/text/text.props.dart';
import 'package:mix/src/widgets/text/text_helpers.dart';

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
    bool? inherit,
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
      getMixContext(context),
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
    final props = TextProps.fromContext(mixContext);

    final directives =
        mixContext.directives.whereType<TextDirectiveAttribute>();

    final sharedProps = SharedProps.fromContext(mixContext);
    if (!sharedProps.visible) {
      return const Empty();
    }
    final content = applyTextDirectives(text, directives);

    if (sharedProps.animated) {
      return AnimatedDefaultTextStyle(
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
        style: props.style ?? context.defaultTextStyle(),
        duration: sharedProps.animationDuration,
        curve: sharedProps.animationCurve,
        softWrap: props.softWrap,
        overflow: props.overflow,
        textAlign: props.textAlign,
        maxLines: props.maxLines,
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
