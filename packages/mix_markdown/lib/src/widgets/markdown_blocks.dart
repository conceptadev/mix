import 'package:flutter/widgets.dart';

/// A start-aligned column of rendered blocks.
class MarkdownBlocks extends StatelessWidget {
  /// Vertical space between blocks.
  final double? spacing;

  /// Rendered blocks.
  final List<Widget> children;

  const MarkdownBlocks({super.key, this.spacing, required this.children});

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: spacing ?? 0,
    children: children,
  );
}
