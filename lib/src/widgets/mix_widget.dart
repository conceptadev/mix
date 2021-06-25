import 'package:flutter/material.dart';

import '../../mix.dart';
import '../mixer/mixer.dart';

/// Mix Widget
abstract class MixWidget extends StatelessWidget {
  /// Constructor
  const MixWidget(
    this.mix, {
    Key? key,
  }) : super(key: key);

  final Mix mix;

  @override
  Widget build(BuildContext context);
}

/// Mixer Widget
abstract class MixerWidget extends StatelessWidget {
  /// Constructor
  const MixerWidget(
    this.mixer, {
    Key? key,
  }) : super(key: key);

  final Mixer mixer;

  @override
  Widget build(BuildContext context);
}
