// ignore: long-parameter-list
// ignore_for_file: long-parameter-list
import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/variants/variant.dart';
import '../../factory/style_mix.dart';
import '../../widgets/container_widget.dart';
import '../../widgets/flex_widget.dart';
import '../../widgets/icon_widget.dart';
import '../../widgets/text_widget.dart';

extension StyleMixExt<T extends Attribute> on StyleMix {
  StyledContainer container({
    required Widget child,
    bool inherit = false,
    Key? key,
    StyleMix? style,
  }) {
    return StyledContainer(
      style: mergeNullable(style),
      key: key,
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
  }) {
    return container(
      inherit: inherit,
      key: key,
      style: mergeNullable(style ?? mix),
      child: child,
    );
  }

  HBox hbox({
    required List<Widget> children,
    bool inherit = false,
    Key? key,
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
  }) {
    return HBox(
      style: mergeNullable(style ?? mix),
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
  }) {
    return StyledRow(
      style: mergeNullable(style ?? mix),
      key: key,
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
  }) {
    return StyledText(
      text,
      style: mergeNullable(style ?? mix),
      key: key,
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
  }) {
    return VBox(
      style: mergeNullable(style ?? mix),
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
  }) {
    return StyledColumn(
      style: mergeNullable(style ?? mix),
      key: key,
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
  }) {
    return StyledIcon(
      icon,
      style: mergeNullable(style ?? mix),
      key: key,
      inherit: inherit,
    );
  }
}
