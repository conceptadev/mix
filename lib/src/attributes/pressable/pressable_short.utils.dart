import 'package:mix/src/attributes/helpers/helper.utils.dart';
import 'package:mix/src/attributes/pressable/pressable.utils.dart';

final disabled =
    const WrapFunction(PressableUtility.disabled).withPositionalToList;
final focus = const WrapFunction(PressableUtility.focus).withPositionalToList;
final hover = const WrapFunction(PressableUtility.hover).withPositionalToList;
final pressing =
    const WrapFunction(PressableUtility.pressing).withPositionalToList;
