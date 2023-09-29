// ignore: long-parameter-list
// ignore_for_file: long-parameter-list
import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../factory/style_mix.dart';
import '../variants/variant.dart';
import '../widgets/container/container.widget.dart';
import '../widgets/flex/flex.widget.dart';
import '../widgets/icon/icon.widget.dart';
import '../widgets/text/text.widget.dart';

extension StyleMixExt<T extends StyleAttribute> on StyleMix {
  StyledContainer container({
    required Widget child,
    bool inherit = false,
    Key? key,
    StyleMix? style,
    List<StyleVariant>? variants,
  }) {
    return StyledContainer(
      style: mergeNullable(style),
      key: key,
      variants: variants,
      inherit: inherit,
      child: child,
    );
  }

  StyledContainer box({
    required Widget child,
    bool inherit = false,
    Key? key,
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
    List<StyleVariant>? variants,
  }) {
    return container(
      inherit: inherit,
      key: key,
      style: mergeNullable(style ?? mix),
      variants: variants,
      child: child,
    );
  }

  HBox hbox({
    required List<Widget> children,
    bool inherit = false,
    Key? key,
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
    List<StyleVariant>? variants,
  }) {
    return HBox(
      style: mergeNullable(style ?? mix),
      variants: variants,
      key: key,
      inherit: inherit,
      children: children,
    );
  }

  StyledRow row({
    required List<Widget> children,
    bool inherit = false,
    Key? key,
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
    List<StyleVariant>? variants,
  }) {
    return StyledRow(
      style: mergeNullable(style ?? mix),
      key: key,
      variants: variants,
      inherit: inherit,
      children: children,
    );
  }

  StyledText text(
    String text, {
    bool inherit = false,
    Key? key,
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    String? semanticsLabel,
    StyleMix? style,
    List<StyleVariant>? variants,
  }) {
    return StyledText(
      text,
      style: mergeNullable(style ?? mix),
      key: key,
      variants: variants,
      inherit: inherit,
      semanticsLabel: semanticsLabel,
    );
  }

  VBox vbox({
    required List<Widget> children,
    bool inherit = false,
    Key? key,
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
    List<StyleVariant>? variants,
  }) {
    return VBox(
      style: mergeNullable(style ?? mix),
      variants: variants,
      key: key,
      inherit: inherit,
      children: children,
    );
  }

  StyledColumn column({
    required List<Widget> children,
    bool inherit = false,
    Key? key,
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
    List<StyleVariant>? variants,
  }) {
    return StyledColumn(
      style: mergeNullable(style ?? mix),
      key: key,
      variants: variants,
      inherit: inherit,
      children: children,
    );
  }

  StyledIcon icon(
    IconData icon, {
    bool inherit = false,
    Key? key,
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
    List<StyleVariant>? variants,
  }) {
    return StyledIcon(
      icon,
      inherit: inherit,
      key: key,
      style: mergeNullable(style ?? mix),
      variants: variants,
    );
  }
}
