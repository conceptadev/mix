import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mix/mix.dart';

enum SizeVariantEnum {
  small,
  medium,
  large,
}

enum LeadingPosition { left, center, right }

@immutable
class ButtonSizeVariant<T extends SizeVariantEnum> extends Variant {
  ButtonSizeVariant(T variant) : super(variant.name);
}

class ButtonSizeVariants {
  static final small = ButtonSizeVariant(SizeVariantEnum.small);
  static final medium = ButtonSizeVariant(SizeVariantEnum.medium);
  static final large = ButtonSizeVariant(SizeVariantEnum.large);
}

StyleMix get _baseStyle => StyleMix(
      borderRadius(4),
      onPress(
        scale(0.95),
      ),
      flex.mainAxisAlignment.center(),
      text.style(
        // added because of lack of style parameters (yellow lines)
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w600,
      ),
      text.style.of($textStyles.bodySmall),
      flex.mainAxisSize.min(),
      ButtonSizeVariants.small(
        padding.horizontal(10),
        padding.vertical(10),
        text.style(
          fontSize: 16,
        ),
        icon(size: 24),
      ),
      ButtonSizeVariants.medium(
        padding.horizontal(4),
        padding.vertical(16),
        text.style(
          fontSize: 16,
        ),
        icon(size: 24),
      ),
      ButtonSizeVariants.large(
        padding.horizontal(4),
        padding.vertical(2),
        text.style(
          fontSize: 16,
        ),
        icon(size: 24),
      ),
    );

abstract class Button extends StatelessWidget {
  const Button(
    this.text, {
    super.key,
    this.size,
    this.style,
    this.onPressed,
    this.onLongPressed,
    this.leading,
    this.leadingPosition = LeadingPosition.left,
    this.interPadding = 12, // ultrashotTheme.spacing.w15
  });

  final String text;
  final ButtonSizeVariant? size;
  final StyleMix? style;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final Widget? leading;
  final LeadingPosition? leadingPosition;
  final double? interPadding;

  Widget get _leftContent {
    if (leading == null ||
        leading != null && leadingPosition != LeadingPosition.left) {
      return SizedBox.fromSize(size: Size.zero);
    }

    return Padding(
      padding: EdgeInsets.only(right: interPadding!),
      child: leading,
    );
  }

  Widget get _centerContent {
    if (leading != null && leadingPosition == LeadingPosition.center) {
      return leading!;
    }

    return StyledText(
      text,
      inherit: true,
      style: StyleMix(),
    );
  }

  Widget get _rightContent {
    if (leading == null ||
        leading != null && leadingPosition != LeadingPosition.right) {
      return SizedBox.fromSize(size: Size.zero);
    }

    return Padding(
      padding: EdgeInsets.only(left: interPadding!),
      child: leading,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mergedStyle = _baseStyle
        .selectVariant(size ?? ButtonSizeVariants.medium)
        .merge(style);

    return Pressable(
      onPressed: onPressed,
      onLongPress: onLongPressed,
      child: HBox(
        style: mergedStyle,
        children: [
          _leftContent,
          _centerContent,
          _rightContent,
        ],
      ),
    );
  }
}

StyleMix get _style => StyleMix(
      text.style(
        color: const Color(0xFFFF004C),
      ),
      backgroundColor(const Color(0x0F07E2FF)),
      icon.color.of($colors.onBackground),
      onDisabled(
        backgroundColor.of($colors.background),
        text.style.color.of($colors.onBackground),
        icon.color.of($colors.onBackground),
      ),
    );

class PrimaryButton extends Button {
  PrimaryButton(
    String text, {
    super.key,
    super.size,
    super.onPressed,
    super.onLongPressed,
    super.leading,
    super.leadingPosition,
  }) : super(text, style: _style);
}

class ButtonExample extends HookWidget {
  const ButtonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      'Primary Button',
      onPressed: () => {},
    );
  }
}
