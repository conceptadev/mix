import 'package:mix/src/attributes/dynamic/dynamic.utils.dart';
import 'package:mix/src/attributes/helpers/helper.utils.dart';

/// Dynamic utilities
const xsmall = DynamicUtils.xsmall;
const small = DynamicUtils.small;
const medium = DynamicUtils.medium;
const large = DynamicUtils.large;

const portrait = DynamicUtils.portrait;
const landscape = DynamicUtils.landscape;

final dark = const WrapFunction(DynamicUtils.dark).withPositionalToList;

const variant = DynamicUtils.variant;
