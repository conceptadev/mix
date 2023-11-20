import '../specs/icon_spec.dart';
import 'attribute.dart';

class IconRecipeAttribute extends DtoAttribute<IconSpec> {
  const IconRecipeAttribute(IconRecipe value) : super(value);

  @override
  IconRecipeAttribute copyWith(IconRecipe value) {
    return IconRecipeAttribute(value);
  }
}
