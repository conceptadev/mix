import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'accordion.spec.dart';

part 'accordion.style.dart';

class _BaseAccordion extends StatefulWidget {
  const _BaseAccordion({
    super.key,
    required this.header,
    required this.content,
    this.onChanged,
    this.expanded = true,
    this.variants = const [],
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    required this.style,
  });

  final Widget header;
  final Widget content;
  final Style style;
  final bool expanded;
  final List<Variant> variants;
  final Duration duration;
  final Curve curve;
  final void Function(bool)? onChanged;

  @override
  State<_BaseAccordion> createState() => _BaseAccordionState();
}

class _BaseAccordionState extends State<_BaseAccordion>
    with TickerProviderStateMixin {
  late MixWidgetStateController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MixWidgetStateController()..selected = widget.expanded;
  }

  void _handleTap() {
    _controller.selected = !_controller.selected;
    widget.onChanged?.call(widget.expanded);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: widget.style,
      builder: (context) {
        final spec = AccordionSpec.of(context);

        return spec.container(
          direction: Axis.vertical,
          children: [
            Pressable(
              onPress: _handleTap,
              controller: _controller,
              child: SizedBox(
                width: double.infinity,
                child: spec.headerContainer(
                  child: SpecBuilder(
                    style: Style(),
                    builder: (context) {
                      return DefaultTextStyle(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        child: widget.header,
                      );
                    },
                  ),
                ),
              ),
            ),
            AnimatedAlign(
              alignment: Alignment.topCenter,
              heightFactor: widget.expanded ? 1 : 0,
              duration: widget.duration,
              curve: widget.curve,
              child: SizedBox(
                width: double.infinity,
                child: spec.contentContainer(
                  child: DefaultTextStyle(
                    style: const TextStyle(color: Colors.black),
                    child: widget.content,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SimpleAccordion extends _BaseAccordion {
  const SimpleAccordion._({
    super.key,
    required super.style,
    required super.content,
    required super.header,
    super.onChanged,
    super.expanded,
    super.duration,
    super.curve,
  });

  factory SimpleAccordion({
    required Widget header,
    required Widget content,
    bool expanded = true,
    void Function(bool)? onChanged,
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = Curves.easeInOut,
  }) {
    return SimpleAccordion._(
      header: header,
      content: content,
      style: _accordionStyle,
      expanded: expanded,
      onChanged: onChanged,
      duration: duration,
      curve: curve,
    );
  }
}
