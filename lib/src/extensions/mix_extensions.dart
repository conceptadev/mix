import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../mixer/mix_factory.dart';
import '../widgets/box/box.widget.dart';
import '../widgets/flex/flex.widget.dart';
import '../widgets/icon/icon.widget.dart';
import '../widgets/text/text.widget.dart';

extension MixExtension<T extends Attribute> on MixFactory {
  Box box({
    MixFactory? overrideMix,
    required Widget child,
  }) {
    return Box(
      mix: mergeNullable(overrideMix),
      child: child,
    );
  }

  HBox hbox({
    MixFactory? overrideMix,
    required List<Widget> children,
  }) {
    return HBox(
      mix: mergeNullable(overrideMix),
      children: children,
    );
  }

  HBox row({
    MixFactory? overrideMix,
    required List<Widget> children,
  }) {
    return hbox(
      overrideMix: overrideMix,
      children: children,
    );
  }

  TextMix text(
    String text, {
    MixFactory? overrideMix,
  }) {
    return TextMix(
      text,
      mix: mergeNullable(overrideMix),
    );
  }

  VBox vbox({
    MixFactory? overrideMix,
    required List<Widget> children,
  }) {
    return VBox(
      mix: mergeNullable(overrideMix),
      children: children,
    );
  }

  VBox column({
    MixFactory? overrideMix,
    required List<Widget> children,
  }) {
    return vbox(
      children: children,
      overrideMix: overrideMix,
    );
  }

  IconMix icon(
    IconData icon, {
    MixFactory? overrideMix,
  }) {
    return IconMix(
      icon,
      mix: mergeNullable(overrideMix),
    );
  }
}
