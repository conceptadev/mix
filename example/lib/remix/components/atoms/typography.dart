import 'package:example/remix/mix_data.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class H1 extends StatelessWidget {
  const H1(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextMix(GlobalMix.typography.h1, text: text);
  }
}

class H2 extends StatelessWidget {
  const H2(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextMix(GlobalMix.typography.h2, text: text);
  }
}

class H3 extends StatelessWidget {
  const H3(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextMix(GlobalMix.typography.h3, text: text);
  }
}

class H4 extends StatelessWidget {
  const H4(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextMix(GlobalMix.typography.h4, text: text);
  }
}

class H5 extends StatelessWidget {
  const H5(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextMix(GlobalMix.typography.h5, text: text);
  }
}

class H6 extends StatelessWidget {
  const H6(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextMix(GlobalMix.typography.h6, text: text);
  }
}

class Body1 extends StatelessWidget {
  const Body1(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextMix(GlobalMix.typography.body1, text: text);
  }
}

class Subtitle extends StatelessWidget {
  const Subtitle(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextMix(GlobalMix.typography.subtitle, text: text);
  }
}

class Body2 extends StatelessWidget {
  const Body2(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextMix(GlobalMix.typography.body2, text: text);
  }
}

class Overline extends StatelessWidget {
  const Overline(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextMix(GlobalMix.typography.overline, text: text);
  }
}

class Caption extends StatelessWidget {
  const Caption(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextMix(GlobalMix.typography.caption, text: text);
  }
}
