import '../attributes/color_attribute.dart';
import '../attributes/scalar_attribute.dart';
import '../attributes/style_mix_attribute.dart';
import '../factory/style_mix.dart';

const visible = VisibleAttribute.new;

VisibleAttribute show([bool condition = true]) {
  return VisibleAttribute(condition);
}

VisibleAttribute hide([bool condition = true]) => show(!condition);

const stackFit = StackFitAttribute.new;

const clip = ClipAttribute.new;

const transform = TransformAttribute.new;

const verticalDirection = VerticalDirectionAttribute.new;

const textDirection = TextDirectionAttribute.new;

const softWrap = SoftWrapAttribute.new;

const textOverflow = TextOverflowAttribute.new;

const textScaleFactor = TextScaleFactorAttribute.new;

const maxLines = MaxLinesAttribute.new;

const textWidthBasis = TextWidthBasisAttribute.new;

const textAlign = TextAlignAttribute.new;

const flexFit = FlexFitAttribute.new;

const axisDirection = AxisAttribute.new;

const mainAxisAlignment = MainAxisAlignmentAttribute.new;

const crossAxisAlignment = CrossAxisAlignmentAttribute.new;

const mainAxisSize = MainAxisSizeAttribute.new;

const iconSize = IconSizeAttribute.new;
const iconColor = IconColorAttribute.new;

const gradient = GradientAttribute.new;
const transformAlignment = TransformAlignmentAttribute.new;
const textBaseline = TextBaselineAttribute.new;
const imageAlignment = ImageAlignmentAttribute.new;
const imageScale = ImageScaleAttribute.new;
const imageFit = ImageFitAttribute.new;
const imageRepeat = ImageRepeatAttribute.new;
const height = HeightAttribute.new;
const width = WidthAttribute.new;
const imageWidth = ImageWidthAttribute.new;
const imageHeight = ImageHeightAttribute.new;
const textHeightBehavior = TextHeightBehaviorAttribute.new;
const boxFit = BoxFitAttribute.new;
const blendMode = BlendModeAttribute.new;
const boxShape = BoxShapeAttribute.new;
const imageColor = ImageColorAttribute.new;

StyleMixAttribute imageSize({double? width, double? height}) {
  final style = StyleMix(
    width == null ? null : imageWidth(width),
    height == null ? null : imageHeight(height),
  );

  return StyleMixAttribute(style);
}
