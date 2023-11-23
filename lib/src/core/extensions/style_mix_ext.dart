// ignore_for_file: long-parameter-list
import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../factory/style_mix.dart';
import '../../recipes/container/container_widget.dart';
import '../../recipes/flex/flex_widget.dart';
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
      style: merge(style),
      key: key,
      inherit: inherit,
      child: child,
    );
  }

  StyledContainer box({
    required Widget child,
    bool inherit = false,
    Key? key,
    StyleMix? style,
    @Deprecated('Use the style parameter instead') StyleMix? mix,
  }) {
    return container(
      inherit: inherit,
      key: key,
      style: style ?? mix,
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
      style: merge(style ?? mix),
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
      style: merge(style ?? mix),
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
      semanticsLabel: semanticsLabel,
      style: merge(style ?? mix),
      key: key,
      inherit: inherit,
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
      style: merge(style ?? mix),
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
      style: merge(style ?? mix),
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
      style: merge(style ?? mix),
      key: key,
      inherit: inherit,
    );
  }
}
