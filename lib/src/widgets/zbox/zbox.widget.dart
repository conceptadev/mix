import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

/// ## Attributes:
/// - [ZBoxAttributes](ZBoxAttributes-class.html)
/// - [SharedAttributes](SharedAttributes-class.html)
/// ## Utilities:
/// - [ZBoxUtility](ZBoxUtility-class.html)
/// - [SharedUtils](SharedUtils-class.html)
///
/// {@category Mixable Widgets}
class ZBox extends MixableWidget {
  final List<Widget> children;

  const ZBox({
    Mix? mix,
    Key? key,
    bool? inherit,
    List<Variant>? variants,
    this.children = const <Widget>[],
  }) : super(
          mix,
          variants: variants,
          inherit: inherit,
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return ZBoxMixedWidget(
      createMixContext(context),
      children: children,
    );
  }
}

/// {@nodoc}
class ZBoxMixedWidget extends MixedWidget {
  final List<Widget> children;

  const ZBoxMixedWidget(
    MixContext mixContext, {
    Key? key,
    this.children = const <Widget>[],
  }) : super(mixContext, key: key);

  @override
  Widget build(BuildContext context) {
    final props = mixContext.zBoxProps;
    return BoxMixedWidget(
      mixContext,
      child: Stack(
        children: children,
        alignment: props.alignment,
        clipBehavior: props.clipBehavior,
        fit: props.fit,
      ),
    );
  }
}
