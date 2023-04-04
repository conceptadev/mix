// ignore: long-parameter-list
// ignore_for_file: long-parameter-list
import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../factory/mix_factory.dart';
import '../variants/variant.dart';
import '../widgets/box/box.widget.dart';
import '../widgets/flex/flex.widget.dart';
import '../widgets/icon/icon.widget.dart';
import '../widgets/text/text.widget.dart';

extension MixExtension<T extends Attribute> on StyleMix {
  Box box({
    @Deprecated('Use the style parameter instead') Mix? mix,
    StyleMix? style,
    Key? key,
    List<Variant>? variants,
    required Widget child,
  }) {
    return Box(
      style: mergeNullable(style ?? mix),
      key: key,
      variants: variants,
      child: child,
    );
  }

  @Deprecated('Use row instead')
  HBox hbox({
    @Deprecated('Use the style parameter instead') Mix? mix,
    StyleMix? style,
    Key? key,
    List<Variant>? variants,
    required List<Widget> children,
  }) {
    return HBox(
      style: mergeNullable(style ?? mix),
      children: children,
    );
  }

  HBox row({
    @Deprecated('Use the style parameter instead') Mix? mix,
    StyleMix? style,
    Key? key,
    List<Variant>? variants,
    required List<Widget> children,
  }) {
    return HBox(
      style: mergeNullable(style ?? mix),
      key: key,
      variants: variants,
      children: children,
    );
  }

  TextMix text(
    String text, {
    @Deprecated('Use the style parameter instead') Mix? mix,
    StyleMix? style,
    Key? key,
    List<Variant>? variants,
    String? semanticsLabel,
  }) {
    return TextMix(
      text,
      style: mergeNullable(style ?? mix),
      key: key,
      variants: variants,
      semanticsLabel: semanticsLabel,
    );
  }

  VBox vbox({
    @Deprecated('Use the style parameter instead') Mix? mix,
    StyleMix? style,
    Key? key,
    List<Variant>? variants,
    required List<Widget> children,
  }) {
    return VBox(
      style: mergeNullable(style ?? mix),
      children: children,
    );
  }

  VBox column({
    @Deprecated('Use the style parameter instead') Mix? mix,
    StyleMix? style,
    Key? key,
    List<Variant>? variants,
    required List<Widget> children,
  }) {
    return vbox(
      children: children,
      style: style ?? mix,
    );
  }

  IconMix icon(
    IconData icon, {
    @Deprecated('Use the style parameter instead') Mix? mix,
    StyleMix? style,
    Key? key,
    List<Variant>? variants,
  }) {
    return IconMix(
      icon,
      style: mergeNullable(style ?? mix),
      key: key,
      variants: variants,
    );
  }
}
