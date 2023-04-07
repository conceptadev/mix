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

extension MixExtension<T extends StyleAttribute> on StyleMix {
  StyledContainer box({
    @Deprecated('Use the style parameter instead') Mix? mix,
    StyleMix? style,
    Key? key,
    List<Variant>? variants,
    required Widget child,
  }) {
    return StyledContainer(
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

  StyledText text(
    String text, {
    @Deprecated('Use the style parameter instead') Mix? mix,
    StyleMix? style,
    Key? key,
    List<Variant>? variants,
    String? semanticsLabel,
  }) {
    return StyledText(
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

  StyledIcon icon(
    IconData icon, {
    @Deprecated('Use the style parameter instead') Mix? mix,
    StyleMix? style,
    Key? key,
    List<Variant>? variants,
  }) {
    return StyledIcon(
      icon,
      style: mergeNullable(style ?? mix),
      key: key,
      variants: variants,
    );
  }
}
