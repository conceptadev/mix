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
    StyleMix? style,
    Key? key,
    bool inherit = false,
    List<StyleVariant>? variants,
    required Widget child,
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
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
    Key? key,
    bool inherit = false,
    List<StyleVariant>? variants,
    required Widget child,
  }) {
    return container(
      style: mergeNullable(style ?? mix),
      key: key,
      variants: variants,
      inherit: inherit,
      child: child,
    );
  }

  HBox hbox({
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
    Key? key,
    bool inherit = false,
    List<StyleVariant>? variants,
    required List<Widget> children,
  }) {
    return HBox(
      style: mergeNullable(style ?? mix),
      key: key,
      variants: variants,
      inherit: inherit,
      children: children,
    );
  }

  StyledRow row({
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
    Key? key,
    bool inherit = false,
    List<StyleVariant>? variants,
    required List<Widget> children,
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
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
    Key? key,
    bool inherit = false,
    List<StyleVariant>? variants,
    String? semanticsLabel,
  }) {
    return StyledText(
      text,
      style: mergeNullable(style ?? mix),
      key: key,
      inherit: inherit,
      variants: variants,
      semanticsLabel: semanticsLabel,
    );
  }

  VBox vbox({
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
    Key? key,
    bool inherit = false,
    List<StyleVariant>? variants,
    required List<Widget> children,
  }) {
    return VBox(
      style: mergeNullable(style ?? mix),
      key: key,
      variants: variants,
      inherit: inherit,
      children: children,
    );
  }

  StyledColumn column({
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
    Key? key,
    bool inherit = false,
    List<StyleVariant>? variants,
    required List<Widget> children,
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
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
    Key? key,
    bool inherit = false,
    List<StyleVariant>? variants,
  }) {
    return StyledIcon(
      icon,
      style: mergeNullable(style ?? mix),
      key: key,
      inherit: inherit,
      variants: variants,
    );
  }
}
