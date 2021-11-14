import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';

typedef TokenMap<T extends Attribute> = Map<String, Mix<T>>;

class TokenNotifier extends InheritedWidget {
  TokenNotifier({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final tokenMap = <Symbol, Mix>{
    #superMix: Mix(
      bgColor(Colors.blue),
    )
  };

  static TokenNotifier? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TokenNotifier>();
  }

  @override
  bool updateShouldNotify(TokenNotifier oldWidget) {
    return tokenMap != oldWidget.tokenMap;
  }
}
