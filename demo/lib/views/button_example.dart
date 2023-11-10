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
      rounded(4),
      animation(
        curve: Curves.easeIn,
        duration: 100,
      ),
      onPress(
        scale(0.95),
      ),
      mainAxisAlignment(MainAxisAlignment.center),
      textStyle(
        // added because of lack of style parameters (yellow lines)
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w600,
        fontFamily: MaterialTextStyles.bodySmall.fontFamily,
      ),
      mainAxisSize(MainAxisSize.min), // For flexbox
      ButtonSizeVariants.small(
        paddingHorizontal(10),
        paddingVertical(10),
        textStyle(
          fontSize: 16,
        ),
        iconSize(24),
      ),
      ButtonSizeVariants.medium(
        paddingHorizontal(4),
        paddingVertical(16),
        textStyle(
          fontSize: 16,
        ),
        iconSize(24),
      ),
      ButtonSizeVariants.large(
        paddingHorizontal(4),
        paddingVertical(2),
        textStyle(
          fontSize: 16,
        ),
        iconSize(24),
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
      textStyle(
        color: const Color(0xFFFF004C),
      ),
      backgroundColor(const Color(0x0F07E2FF)),
      iconColor(_MaterialDesignColors.onBackground),
      onDisabled(
        backgroundColor(_MaterialDesignColors.background.withOpacity(0.3)),
        textStyle(color: _MaterialDesignColors.onBackground.withOpacity(0.3)),
        iconColor(_MaterialDesignColors.onBackground.withOpacity(0.3)),
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
