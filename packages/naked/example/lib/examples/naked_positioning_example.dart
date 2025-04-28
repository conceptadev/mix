import 'package:flutter/material.dart';
import 'package:naked/naked.dart';

class NakedPositioningExample extends StatefulWidget {
  const NakedPositioningExample({super.key});

  @override
  State<NakedPositioningExample> createState() =>
      _NakedPositioningExampleState();
}

class _NakedPositioningExampleState extends State<NakedPositioningExample> {
  final _buttonKey = GlobalKey();
  bool _showContent = false;
  Rect? _buttonRect;
  AnchorPosition _selectedPosition = AnchorPosition.bottomCenter;
  double _offsetX = 0;
  double _offsetY = 0;

  // List of all possible positions to demonstrate
  final List<AnchorPosition> _allPositions = [
    AnchorPosition.bottomCenter,
    AnchorPosition.topCenter,
    AnchorPosition.leftCenter,
    AnchorPosition.rightCenter,
    AnchorPosition.topLeft,
    AnchorPosition.topRight,
    AnchorPosition.bottomLeft,
    AnchorPosition.bottomRight,
  ];

  // Mapping of positions to display names
  final Map<AnchorPosition, String> _positionLabels = {
    AnchorPosition.bottomCenter: 'Bottom Center',
    AnchorPosition.topCenter: 'Top Center',
    AnchorPosition.leftCenter: 'Left Center',
    AnchorPosition.rightCenter: 'Right Center',
    AnchorPosition.topLeft: 'Top Left',
    AnchorPosition.topRight: 'Top Right',
    AnchorPosition.bottomLeft: 'Bottom Left',
    AnchorPosition.bottomRight: 'Bottom Right',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NakedPositioning Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Positioning Controls',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Position selection controls
            const Text('Select anchor position:'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _allPositions.map((position) {
                return ChoiceChip(
                  label: Text(_positionLabels[position]!),
                  selected: _selectedPosition == position,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _selectedPosition = position;
                      });
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            // Offset controls
            const Text('X Offset:'),
            Slider(
              min: -50,
              max: 50,
              divisions: 100,
              value: _offsetX,
              label: _offsetX.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _offsetX = value;
                });
              },
            ),
            const Text('Y Offset:'),
            Slider(
              min: -50,
              max: 50,
              divisions: 100,
              value: _offsetY,
              label: _offsetY.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _offsetY = value;
                });
              },
            ),
            const SizedBox(height: 32),
            // Demo area
            Expanded(
              child: Center(
                child: Stack(
                  children: [
                    // Button to toggle content
                    Center(
                      child: ElevatedButton(
                        key: _buttonKey,
                        onPressed: () {
                          _updateButtonRect();
                          setState(() {
                            _showContent = !_showContent;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                        child: const Text('Toggle Positioned Content'),
                      ),
                    ),
                    // Positioned content
                    if (_showContent && _buttonRect != null)
                      _buildPositionedContent(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Update the button's rectangle position
  void _updateButtonRect() {
    final RenderBox? renderBox =
        _buttonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      setState(() {
        _buttonRect = Rect.fromLTWH(
          position.dx,
          position.dy,
          renderBox.size.width,
          renderBox.size.height,
        );
      });
    }
  }

  // Build the positioned content
  Widget _buildPositionedContent() {
    return NakedPositioning(
      target: _buttonRect!,
      preferredPositions: [_selectedPosition],
      offset: Offset(_offsetX, _offsetY),
      constraints: const BoxConstraints(maxWidth: 300),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Positioned with ${_positionLabels[_selectedPosition]}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'This content is positioned using NakedPositioning. '
              'Try changing the anchor position and offsets to see how it affects placement.',
            ),
            const SizedBox(height: 8),
            Text('Offset: (${_offsetX.toStringAsFixed(1)}, '
                '${_offsetY.toStringAsFixed(1)})'),
          ],
        ),
      ),
    );
  }
}
