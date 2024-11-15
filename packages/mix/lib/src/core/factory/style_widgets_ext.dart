// ignore_for_file: long-parameter-list
import 'package:flutter/widgets.dart';

import '../../specs/box/box_widget.dart';
import '../../specs/flex/flex_widget.dart';
import '../../specs/flexbox/flexbox_widget.dart';
import '../../specs/icon/icon_widget.dart';
import '../../specs/text/text_widget.dart';
import 'style_mix.dart';

extension StyleExt on Style {
  Box container({
    required Widget child,
    bool inherit = false,
    Key? key,
    Style? style,
  }) {
    return Box(
      key: key,
      style: merge(style),
      inherit: inherit,
      child: child,
    );
  }

  Box box({
    required Widget child,
    bool inherit = false,
    Key? key,
    Style? style,
  }) {
    return container(key: key, inherit: inherit, style: style, child: child);
  }

  HBox hbox({
    required List<Widget> children,
    bool inherit = false,
    Key? key,
    Style? style,
  }) {
    return HBox(
      key: key,
      style: merge(style),
      inherit: inherit,
      children: children,
    );
  }

  StyledRow row({
    required List<Widget> children,
    bool inherit = false,
    Key? key,
    Style? style,
  }) {
    return StyledRow(
      key: key,
      style: merge(style),
      inherit: inherit,
      children: children,
    );
  }

  StyledText text(
    String text, {
    bool inherit = false,
    Key? key,
    String? semanticsLabel,
    Style? style,
  }) {
    return StyledText(
      text,
      key: key,
      semanticsLabel: semanticsLabel,
      style: merge(style),
      inherit: inherit,
    );
  }

  VBox vbox({
    required List<Widget> children,
    bool inherit = false,
    Key? key,
    Style? style,
  }) {
    return VBox(
      key: key,
      style: merge(style),
      inherit: inherit,
      children: children,
    );
  }

  StyledColumn column({
    required List<Widget> children,
    bool inherit = false,
    Key? key,
    Style? style,
  }) {
    return StyledColumn(
      key: key,
      style: merge(style),
      inherit: inherit,
      children: children,
    );
  }

  StyledIcon icon(
    IconData icon, {
    bool inherit = false,
    Key? key,
    Style? style,
  }) {
    return StyledIcon(icon, key: key, style: merge(style), inherit: inherit);
  }
}
