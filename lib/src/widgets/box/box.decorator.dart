import '../../decorators/decorator.dart';

abstract class WidgetDecorator<T extends WidgetDecorator<T>>
    extends Decorator<T> {
  const WidgetDecorator({
    super.key,
  });

  @override
  T merge(covariant T other);
}
