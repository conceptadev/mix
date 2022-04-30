import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

class ZBox extends MixableWidget {
  final List<Widget> children;

  const ZBox({
    Mix? mix,
    Key? key,
    this.children = const <Widget>[],
  }) : super(mix, key: key);

  @override
  Widget build(BuildContext context) {
    return ZBoxMixedWidget(
      MixContext.create(context: context, mix: mix),
      children: children,
    );
  }
}

class ZBoxMixedWidget extends MixedWidget {
  final List<Widget> children;

  const ZBoxMixedWidget(
    MixContext mixed, {
    Key? key,
    this.children = const <Widget>[],
  }) : super(mixed, key: key);

  @override
  Widget build(BuildContext context) {
    return BoxMixedWidget(
      mixContext,
      child: Stack(
        children: children,
        alignment: zBoxMixer.alignment,
        clipBehavior: zBoxMixer.clipBehavior,
        fit: zBoxMixer.fit,
      ),
    );
  }
}
