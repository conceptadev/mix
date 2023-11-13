// ignore_for_file: avoid-non-ascii-symbols

import 'dart:math';

import 'package:flutter/scheduler.dart';

// Class responsible for representing the state of a single character transition.
class Character {
  final String from;
  final String to;
  final int start;
  final int end;
  String char = '';

  // Initializes a new instance of the [Character] class.
  // [from] is the initial character.
  // [to] is the character that we want to transition to.
  // [start] and [end] represent the frame range for the transition.
  Character(this.from, this.to, this.end, this.start);
}

/// [TextDecodingController] is a controller that manages the process of text decoding animation
///
/// by providing efficient and Flutter-friendly state management for the animation states.
class TextDecodingController {
  final Function(String value) _fn;
  // The current state of the decoding process.
  String _data = '';
  // Current frame of the decoding process.
  int _frame = 0;
  // Set of possible characters used during transition.
  final _chars = '!<>-_\\/[]{}—=+*^?#________';
  // Queue to hold the Characters during the transition.
  final _queue = <Character>[];
  // Random instance for generating random start and end points.
  final _random = Random();
  // Ticker used for advancing frames.
  Ticker? _ticker;

  // Constructor for the [TextDecodingController] class.
  TextDecodingController(Function(String value) fn) : _fn = fn;

  /// Updates the data to be decoded in animation.
  ///
  /// The given string [newText] is the target result of the animation and signifies the end-state.
  void setData(String newText) {
    final length = max(_data.length, newText.length);
    final oldText = _data.padRight(length);
    newText = newText.padRight(length);

    // Clear previous queue and populate it with characters from the new string.
    _queue.clear();
    for (int i = 0; i < length; i++) {
      final from = oldText[i];
      final to = newText[i];
      final start = _random.nextInt(200);
      final end = start + _random.nextInt(200);
      _queue.add(Character(from, to, end, start));
    }
    _startTicker();
  }

  /// Stops the animation and releases allocated ticker resources.
  void dispose() {
    _ticker?.stop(canceled: true); // Stop the ticker safely.
  }

  /// Initializes the ticker that drives the animation.
  void _startTicker() {
    _ticker?.stop(canceled: true);
    _ticker = Ticker(_update); // Start the Ticker with frame update function..
    _ticker?.start();
  }

  /// Frame update handler. Updates the state of characters during transition and applies them in order.
  void _update(Duration elapsedTime) {
    String output = '';
    int complete = 0;

    for (Character c in _queue) {
      if (_frame >= c.end) {
        complete++;
        output += c.to;
      } else if (_frame >= c.start) {
        c.char = _randomChar();
        output += c.char;
      } else {
        output += c.from;
      }
    }

    _data = output;
    _fn(_data);

    // Once all characters have transitioned, stop the ticker.
    if (complete == _queue.length) {
      _ticker?.stop();
    } else {
      _frame++; // If not, move on to the next frame.
    }
  }

  /// Returns a random character from the pool of possible characters.
  String _randomChar() {
    return _chars[_random.nextInt(_chars.length)];
  }
}
