import 'dart:async';

import 'package:flutter/material.dart';
import 'package:naked/naked.dart';

class NakedTooltipExample extends StatefulWidget {
  const NakedTooltipExample({super.key});

  @override
  State<NakedTooltipExample> createState() => _NakedTooltipExampleState();
}

class _NakedTooltipExampleState extends State<NakedTooltipExample> {
  bool _isTooltipVisible = false;
  Timer? _hoverTimer;

  @override
  void dispose() {
    _hoverTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            NakedTooltip(
              visible: _isTooltipVisible,
              tooltipWidget: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'This tooltip appears after hovering for 2 seconds',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              child: MouseRegion(
                onEnter: (_) {
                  _hoverTimer?.cancel();
                  _hoverTimer = Timer(const Duration(seconds: 1), () {
                    if (mounted) {
                      setState(() {
                        _isTooltipVisible = true;
                      });
                    }
                  });
                },
                onExit: (_) {
                  _hoverTimer?.cancel();
                  setState(() {
                    _isTooltipVisible = false;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Hover me for 2 seconds',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
