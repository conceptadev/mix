import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import 'widget_decorators.dart';

T selfBuilder<T extends StyleAttribute>(T decorator) => decorator;

const scale = ScaleUtility(selfBuilder);
const opacity = OpacityUtility(selfBuilder);
const rotate = RotateUtility(selfBuilder);

const clipPath = ClipPathUtility(selfBuilder);
const clipRRect = ClipRRectUtility(selfBuilder);
const clipOval = ClipOvalUtility(selfBuilder);
const clipRect = ClipRectUtility(selfBuilder);
const clipTriangle = ClipTriangleUtility(selfBuilder);

const visibility = VisibilityUtility(selfBuilder);
const aspectRatio = AspectRatioUtility(selfBuilder);
const flexible = FlexibleDecoratorUtility(selfBuilder);
const transform = TransformUtility(selfBuilder);
const align = AlignDecoratorUtility(selfBuilder);
const fractionallySizedBox = FractionallySizedBoxDecoratorUtility(selfBuilder);
const sizedBox = SizedBoxDecoratorUtility(selfBuilder);

class ScaleUtility<T extends StyleAttribute>
    extends MixUtility<T, ScaleDecorator> {
  const ScaleUtility(super.builder);
  T call(double value, {Key? key}) => builder(ScaleDecorator(value, key: key));
}

class OpacityUtility<T extends StyleAttribute>
    extends MixUtility<T, OpacityDecorator> {
  const OpacityUtility(super.builder);
  T call(double value, {Key? key}) =>
      builder(OpacityDecorator(value, key: key));
}

class TransformUtility<T extends StyleAttribute>
    extends MixUtility<T, TransformDecorator> {
  const TransformUtility(super.builder);
  T call(Matrix4 value, {Key? key}) =>
      builder(TransformDecorator(value, key: key));
}

class RotateUtility<T extends StyleAttribute>
    extends MixUtility<T, RotateDecorator> {
  const RotateUtility(super.builder);
  T d90() => builder(const RotateDecorator(1));
  T d180() => builder(const RotateDecorator(2));
  T d270() => builder(const RotateDecorator(3));

  T call(int value, {Key? key}) => builder(RotateDecorator(value, key: key));
}

class VisibilityUtility<T extends StyleAttribute>
    extends MixUtility<T, VisibilityDecorator> {
  const VisibilityUtility(super.builder);
  T on() => builder(const VisibilityDecorator(true));
  T off() => builder(const VisibilityDecorator(false));

  // ignore: prefer-named-boolean-parameters
  T call(bool value, {Key? key}) =>
      builder(VisibilityDecorator(value, key: key));
}

class FlexibleDecoratorUtility<T extends StyleAttribute>
    extends MixUtility<T, FlexibleDecorator> {
  const FlexibleDecoratorUtility(super.builder);
  FlexFitUtility<T> get fit => FlexFitUtility((fit) => call(fit: fit));
  IntUtility<T> get flex => IntUtility((flex) => call(flex: flex));
  T tight() => builder(const FlexibleDecorator(fit: FlexFit.tight));
  T loose() => builder(const FlexibleDecorator(fit: FlexFit.loose));
  T expanded() => tight();

  T call({int? flex, FlexFit? fit, Key? key}) {
    return builder(FlexibleDecorator(flex: flex, fit: fit, key: key));
  }
}

class AlignDecoratorUtility<T extends StyleAttribute>
    extends MixUtility<T, AlignDecorator> {
  const AlignDecoratorUtility(super.builder);
  T call({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
    Key? key,
  }) {
    return builder(
      AlignDecorator(
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        key: key,
      ),
    );
  }
}

class FractionallySizedBoxDecoratorUtility<T extends StyleAttribute>
    extends MixUtility<T, FractionallySizedBoxDecorator> {
  const FractionallySizedBoxDecoratorUtility(super.builder);

  T call({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
    Key? key,
  }) {
    return builder(
      FractionallySizedBoxDecorator(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        alignment: alignment,
        key: key,
      ),
    );
  }
}

class SizedBoxDecoratorUtility<T extends StyleAttribute>
    extends MixUtility<T, SizedBoxDecorator> {
  const SizedBoxDecoratorUtility(super.builder);

  T call({double? width, double? height, Key? key}) {
    return builder(SizedBoxDecorator(width: width, height: height, key: key));
  }
}

class AspectRatioUtility<T extends StyleAttribute>
    extends MixUtility<T, AspectRatioDecorator> {
  const AspectRatioUtility(super.builder);
  T call(double value, {Key? key}) {
    return builder(AspectRatioDecorator(value, key: key));
  }
}

class ClipPathUtility<T extends StyleAttribute>
    extends MixUtility<T, ClipPathDecorator> {
  const ClipPathUtility(super.builder);

  T call({Clip? clipBehavior, CustomClipper<Path>? clipper, Key? key}) {
    return builder(
      ClipPathDecorator(
        clipBehavior: clipBehavior,
        clipper: clipper,
        key: key,
      ),
    );
  }
}

class ClipRRectUtility<T extends StyleAttribute>
    extends MixUtility<T, ClipRRectDecorator> {
  const ClipRRectUtility(super.builder);
  T call({
    BorderRadius? borderRadius,
    CustomClipper<RRect>? clipper,
    Clip? clipBehavior,
    Key? key,
  }) {
    return builder(
      ClipRRectDecorator(
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        clipper: clipper,
        key: key,
      ),
    );
  }
}

class ClipOvalUtility<T extends StyleAttribute>
    extends MixUtility<T, ClipOvalDecorator> {
  const ClipOvalUtility(super.builder);
  T call({Clip? clipBehavior, CustomClipper<Rect>? clipper, Key? key}) {
    return builder(ClipOvalDecorator(
      clipBehavior: clipBehavior,
      clipper: clipper,
      key: key,
    ));
  }
}

class ClipRectUtility<T extends StyleAttribute>
    extends MixUtility<T, ClipRectDecorator> {
  const ClipRectUtility(super.builder);
  T call({Clip? clipBehavior, CustomClipper<Rect>? clipper, Key? key}) {
    return builder(ClipRectDecorator(
      clipBehavior: clipBehavior,
      clipper: clipper,
      key: key,
    ));
  }
}

class ClipTriangleUtility<T extends StyleAttribute>
    extends MixUtility<T, ClipTriangleDecorator> {
  const ClipTriangleUtility(super.builder);
  T call({Clip? clipBehavior, Key? key}) {
    return builder(ClipTriangleDecorator(
      clipBehavior: clipBehavior,
      key: key,
    ));
  }
}
