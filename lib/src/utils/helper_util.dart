import 'package:flutter/widgets.dart';

import '../core/decorator.dart';
import '../decorators/widget_decorator_widget.dart';
import '../factory/mix_provider_data.dart';

typedef FunctionWithParams<ParamT, ReturnT> = ReturnT Function(
  List<ParamT> params,
);

class SpreadFunctionParams<ParamT, ReturnT> {
  final FunctionWithParams<ParamT, ReturnT> fn;

  const SpreadFunctionParams(this.fn);

  ReturnT call([
    ParamT? p1,
    ParamT? p2,
    ParamT? p3,
    ParamT? p4,
    ParamT? p5,
    ParamT? p6,
    ParamT? p7,
    ParamT? p8,
    ParamT? p9,
    ParamT? p10,
    ParamT? p11,
    ParamT? p12,
    ParamT? p13,
    ParamT? p14,
    ParamT? p15,
    ParamT? p16,
    ParamT? p17,
    ParamT? p18,
    ParamT? p19,
    ParamT? p20,
  ]) {
    return fn([
      p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, //
      p12, p13, p14, p15, p16, p17, p18, p19, p20,
    ].whereType<ParamT>().toList());
  }
}

Widget shouldApplyDecorators({
  required MixData mix,
  required Widget child,
  List<Type> orderOfDecorators = const [],
}) {
  final hasDecorators = mix.contains<DecoratorAttribute>();

  if (!hasDecorators) return child;

  return RenderDecorators(
    mix: mix,
    orderOfDecorators: orderOfDecorators,
    child: child,
  );
}
