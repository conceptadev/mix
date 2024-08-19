import 'package:mix/mix.dart';

import 'button.variants.dart';

Style container() => Style(
      $flex.gap(6),
      $flex.mainAxisAlignment.center(),
      $flex.crossAxisAlignment.center(),
      $flex.mainAxisSize.min(),
      // ButtonSize.xsmall(
      //   $box.padding.horizontal.ref($token.space.xxsmall),
      //   $box.padding.vertical.ref($token.space.xxxsmall),
      // ),
      // ButtonSize.small(
      //   $box.padding.horizontal.ref($token.space.xsmall),
      //   $box.padding.vertical.ref($token.space.xxsmall),
      // ),

      // ButtonSize.large(
      //   $box.padding.horizontal.ref($token.space.medium),
      //   $box.padding.vertical.ref($token.space.xsmall),
      // ),

      // ButtonType.secondary(
      //   $box.color.grey.shade200(),
      //   $on.hover(
      //     $box.color.grey.shade100(),
      //   ),
      // ),
      // ButtonType.destructive(
      //   $box.color.redAccent(),
      //   $on.hover(
      //     $box.color.redAccent.shade200(),
      //   ),
      // ),
      // ButtonType.outline(
      //   $box.color.ref($token.color.onPrimary),
      //   $box.border.width(1.5),
      //   $box.border.color.black12(),
      //   $box.shadow.color(Colors.black12.withOpacity(0.1)),
      //   $box.shadow.blurRadius(1),
      // ),
      // ButtonType.ghost(
      //   $box.color.transparent(),
      //   $on.hover(
      //     $box.color.black12(),
      //   ),
      // ),
      // ButtonType.link(
      //   $box.color.transparent(),
      // ),
      $box.borderRadius(6),
    );

Style icon() => Style(
      // ButtonSize.xsmall(
      //   $icon.size(12),
      // ),
      // ButtonSize.small(
      //   $icon.size(14),
      // ),
      ButtonSize.medium(
        $icon.size(16),
      ),
      // ButtonSize.large(
      //   $icon.size(18),
      // ),
      // (ButtonType.primary | ButtonType.destructive)(
      //   $icon.color(Colors.white),
      // ),
      // (ButtonType.link | ButtonType.secondary | ButtonType.outline)(
      //   $icon.color(Colors.black),
      // ),
    );

Style label() => Style(
      // $text.style.height(1.1),
      // $text.style.letterSpacing(0.5),
      // $text.style.fontWeight(FontWeight.w600),
      // ButtonSize.xsmall(
      //   $text.style.fontSize(12),
      // ),
      // ButtonSize.small(
      //   $text.style.fontSize(14),
      // ),
      ButtonSize.medium(
        $text.style.fontSize(16),
      ),
      // ButtonSize.large(
      //   $text.style.fontSize(18),
      // ),

      // ButtonType.secondary(
      //   $text.style.color.ref($token.color.primaryHover),
      // ),
      // ButtonType.destructive(
      //   $text.style.color.ref($token.color.onPrimary),
      // ),
      // ButtonType.outline(
      //   $text.style.color.ref($token.color.primary),
      // ),
      // ButtonType.ghost(
      //   $text.style.color.ref($token.color.primary),
      // ),
      // ButtonType.link(
      //   $text.style.color.ref($token.color.primary),
      //   $on.hover(
      //     $text.style.decoration(TextDecoration.underline),
      //   ),
      // ),
    );
