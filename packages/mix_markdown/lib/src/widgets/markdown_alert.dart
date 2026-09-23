import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import '../specs/markdown_alert_spec.dart';
import '../specs/markdown_alert_type.dart';
import '../specs/markdown_alert_type_spec.dart';
import 'markdown_blocks.dart';

/// A GitHub alert: a styled box with an icon and title row above its body.
class MarkdownAlert extends StatelessWidget {
  /// The alert kind, which selects the slot of [styleSpec] to apply.
  final MarkdownAlertType type;

  /// Alert styles, or null for unstyled defaults.
  final StyleSpec<MarkdownAlertSpec>? styleSpec;

  /// Vertical space between the header and the body blocks.
  final double? blockSpacing;

  /// Rendered body blocks.
  final List<Widget> children;

  const MarkdownAlert({
    super.key,
    required this.type,
    required this.styleSpec,
    this.blockSpacing,
    required this.children,
  });

  StyleSpec<MarkdownAlertTypeSpec> _typeSpec(MarkdownAlertSpec spec) {
    final selected = switch (type) {
      MarkdownAlertType.note => spec.note,
      MarkdownAlertType.tip => spec.tip,
      MarkdownAlertType.important => spec.important,
      MarkdownAlertType.warning => spec.warning,
      MarkdownAlertType.caution => spec.caution,
    };

    return selected ?? const StyleSpec(spec: MarkdownAlertTypeSpec());
  }

  Widget _buildAlert(BuildContext context, MarkdownAlertTypeSpec spec) => Box(
    styleSpec: spec.container,
    child: MarkdownBlocks(
      spacing: blockSpacing,
      children: [
        RowBox(
          styleSpec: spec.header,
          children: [
            StyledIcon(
              icon: spec.icon?.spec.icon ?? type.defaultIcon,
              styleSpec: spec.icon,
            ),
            StyledText(spec.label ?? type.defaultLabel, styleSpec: spec.title),
          ],
        ),
        ...children,
      ],
    ),
  );

  @override
  Widget build(BuildContext context) => StyleSpecBuilder<MarkdownAlertSpec>(
    styleSpec: styleSpec ?? const StyleSpec(spec: MarkdownAlertSpec()),
    builder: (context, spec) => StyleSpecBuilder<MarkdownAlertTypeSpec>(
      styleSpec: _typeSpec(spec),
      builder: _buildAlert,
    ),
  );
}
