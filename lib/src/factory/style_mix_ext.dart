// ignore_for_file: long-parameter-list
import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../specs/container/box_widget.dart';
import '../specs/flex/flex_widget.dart';
import '../specs/icon/icon_widget.dart';
import '../specs/text/text_widget.dart';
import 'style_mix.dart';

extension StyleExt<T extends Attribute> on Style {
  Box container({
    required Widget child,
    bool inherit = false,
    Key? key,
    Style? style,
  }) {
    return Box(
      style: merge(style),
      key: key,
      inherit: inherit,
      child: child,
    );
  }

  Box box({
    required Widget child,
    bool inherit = false,
    Key? key,
    Style? style,
    @Deprecated('Use the style parameter instead') Style? mix,
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
    @Deprecated('Use the style parameter instead') Style? mix,
    Style? style,
  }) {
    return HBox(
      style: merge(style ?? mix),
      key: key,
      inherit: inherit,
      children: children,
    );
  }

  FlexBox row({
    required List<Widget> children,
    bool inherit = false,
    Key? key,
    @Deprecated('Use the style parameter instead') Style? mix,
    Style? style,
  }) {
    return FlexBox(
      style: merge(style ?? mix),
      key: key,
      inherit: inherit,
      direction: Axis.horizontal,
      children: children,
    );
  }

  StyledText text(
    String text, {
    bool inherit = false,
    Key? key,
    @Deprecated('Use the style parameter instead') Style? mix,
    String? semanticsLabel,
    Style? style,
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
    @Deprecated('Use the style parameter instead') Style? mix,
    Style? style,
  }) {
    return VBox(
      style: merge(style ?? mix),
      key: key,
      inherit: inherit,
      children: children,
    );
  }

  FlexBox column({
    required List<Widget> children,
    bool inherit = false,
    Key? key,
    @Deprecated('Use the style parameter instead') Style? mix,
    Style? style,
  }) {
    return FlexBox(
      style: merge(style ?? mix),
      key: key,
      inherit: inherit,
      direction: Axis.vertical,
      children: children,
    );
  }

  StyledIcon icon(
    IconData icon, {
    bool inherit = false,
    Key? key,
    @Deprecated('Use the style parameter instead') Style? mix,
    Style? style,
  }) {
    return StyledIcon(
      icon,
      style: merge(style ?? mix),
      key: key,
      inherit: inherit,
    );
  }
}
