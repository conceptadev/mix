// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/button/button.variants.dart';

Style get buttonStyle => Style(
      _containerStyle(),
      _iconStyle(),
      _labelStyle(),
    );

Style get _containerStyle => Style(
      $flex.gap(6),
      $flex.mainAxisAlignment.center(),
      $flex.crossAxisAlignment.center(),
      $flex.mainAxisSize.min(),
      ButtonSize.xsmall(
        $box.padding.horizontal(8),
        $box.padding.vertical(4),
      ),
      ButtonSize.small(
        $box.padding.horizontal(12),
        $box.padding.vertical(6),
      ),
      ButtonSize.medium(
        $box.padding.horizontal(16),
        $box.padding.vertical(8),
      ),
      ButtonSize.large(
        $box.padding.horizontal(20),
        $box.padding.vertical(10),
      ),
      ButtonType.primary(
        $box.color.black(),
        $on.hover(
          $box.color.black87(),
        ),
      ),
      ButtonType.secondary(
        $box.color.grey.shade200(),
        $on.hover(
          $box.color.grey.shade100(),
        ),
      ),
      ButtonType.destructive(
        $box.color.redAccent(),
        $on.hover(
          $box.color.redAccent.shade200(),
        ),
      ),
      ButtonType.outline(
        $box.color.white(),
        $box.border.width(1.5),
        $box.border.color.black12(),
        $box.shadow.color(Colors.black12.withOpacity(0.1)),
        $box.shadow.blurRadius(1),
      ),
      ButtonType.ghost(
        $box.color.transparent(),
        $on.hover(
          $box.color.black12(),
        ),
      ),
      ButtonType.link(
        $box.color.transparent(),
      ),
      $box.borderRadius(6),
    );

Style get _iconStyle => Style(
      ButtonSize.xsmall($icon.size(12)),
      ButtonSize.small($icon.size(14)),
      ButtonSize.medium($icon.size(16)),
      ButtonSize.large($icon.size(18)),
      (ButtonType.primary | ButtonType.destructive)(
        $icon.color(Colors.white),
      ),
      (ButtonType.link | ButtonType.secondary | ButtonType.outline)(
        $icon.color(Colors.black),
      ),
    );

Style get _labelStyle => Style(
      $text.style.height(1.1),
      $text.style.letterSpacing(0.5),
      $text.style.fontWeight(FontWeight.w600),
      ButtonSize.xsmall(
        $text.style.fontSize(12),
      ),
      ButtonSize.small(
        $text.style.fontSize(14),
      ),
      ButtonSize.medium(
        $text.style.fontSize(16),
      ),
      ButtonSize.large(
        $text.style.fontSize(18),
      ),
      ButtonType.primary(
        $text.style.color.white(),
      ),
      ButtonType.secondary(
        $text.style.color.black87(),
      ),
      ButtonType.destructive(
        $text.style.color.white(),
      ),
      ButtonType.outline(
        $text.style.color.black(),
      ),
      ButtonType.ghost(
        $text.style.color.black(),
      ),
      ButtonType.link(
        $text.style.color.black(),
        $on.hover(
          $text.style.decoration(TextDecoration.underline),
        ),
      ),
    );
