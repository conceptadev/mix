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

extension MixExtension<T extends Attribute> on Mix {
  Box box({
    Mix? mix,
    Key? key,
    List<Variant>? variants,
    required Widget child,
  }) {
    return Box(
      mix: mergeNullable(mix),
      key: key,
      variants: variants,
      child: child,
    );
  }

  @Deprecated('Use row instead')
  HBox hbox({
    Mix? mix,
    Key? key,
    List<Variant>? variants,
    required List<Widget> children,
  }) {
    return HBox(
      mix: mergeNullable(mix),
      children: children,
    );
  }

  HBox row({
    Mix? mix,
    Key? key,
    List<Variant>? variants,
    required List<Widget> children,
  }) {
    return HBox(
      mix: mergeNullable(mix),
      key: key,
      variants: variants,
      children: children,
    );
  }

  TextMix text(
    String text, {
    Mix? mix,
    Key? key,
    List<Variant>? variants,
    String? semanticsLabel,
  }) {
    return TextMix(
      text,
      mix: mergeNullable(mix),
      key: key,
      variants: variants,
      semanticsLabel: semanticsLabel,
    );
  }

  VBox vbox({
    Mix? mix,
    Key? key,
    List<Variant>? variants,
    required List<Widget> children,
  }) {
    return VBox(
      mix: mergeNullable(mix),
      children: children,
    );
  }

  VBox column({
    Mix? mix,
    Key? key,
    List<Variant>? variants,
    required List<Widget> children,
  }) {
    return vbox(
      children: children,
      mix: mix,
    );
  }

  IconMix icon(
    IconData icon, {
    Mix? mix,
    Key? key,
    List<Variant>? variants,
  }) {
    return IconMix(
      icon,
      mix: mergeNullable(mix),
      key: key,
      variants: variants,
    );
  }
}
