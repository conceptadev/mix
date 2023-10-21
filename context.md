
Beginning of file: lib/mix.dart


Beginning of file: lib/exports.dart


Beginning of file: lib/src/core/directives/directives/glitch.dart

class GlitchText extends StatefulWidget
- String text
- TextStyle style
- _GlitchTextState createState()
class _GlitchTextState extends State
- Unknown _random
- Timer _positionTimer
- Timer _shadowTimer
- double _offsetX
- double _offsetY
- double _shadowOffsetX
- double _shadowOffsetY
- double _scale
- void initState()
- void _randomizePosition(Timer timer)
- void _randomizeShadow(Timer timer)
- void dispose()
- Widget build(BuildContext context)

Beginning of file: lib/src/core/directives/directives/counter.dart

class MyApp extends StatelessWidget
- Widget build(BuildContext context)
class NumberTickerExample extends StatefulWidget
- _NumberTickerExampleState createState()
class _NumberTickerExampleState extends State
- Unknown _textController
- double _value
- void _updateValue()
- Widget build(BuildContext context)
class AnimatedNumberTicker extends StatefulWidget
- double value
- _AnimatedNumberTickerState createState()
class _AnimatedNumberTickerState extends State with SingleTickerProviderStateMixin
- AnimationController _controller
- Animation<double> _animation
- void initState()
- void didUpdateWidget(AnimatedNumberTicker oldWidget)
- void dispose()
- Widget build(BuildContext context)

Beginning of file: lib/src/core/directives/directives/controllers.dart

class Character
- String from
- String to
- int start
- int end
- String char
class TextDecodingController
-  Function(String value) _fn
- String _data
- int _frame
- Unknown _chars
- Unknown _queue
- Unknown _random
- Ticker? _ticker
- void setData(String newText)
- void dispose()
- void _startTicker()
- void _update(Duration elapsedTime)
- String _randomChar()

Beginning of file: lib/src/core/directives/color_dto_directives.dart


Beginning of file: lib/src/core/directives/text_directive.dart

class UppercaseDirective extends TextDirective
- String modify(String value)
class CapitalizeDirective extends TextDirective
- String modify(String value)
class LowercaseDirective extends TextDirective
- String modify(String value)
class SentenceCaseDirective extends TextDirective
- String modify(String value)
class TitleCaseDirective extends TextDirective
- String modify(String value)
class TextDirective extends Directive
- String modify(String value)

Beginning of file: lib/src/core/directives/directive_attribute.dart

class Directive with Comparable
- T modify(T value)
- get null props

Beginning of file: lib/src/core/dto/radius_dto.dart

class RadiusDto extends Dto
- Unknown zero
- double? _x
- double? _y
- RadiusDto? maybeFrom(Radius? radius)
- get double? x
- get double? y
- RadiusDto merge(RadiusDto? other)
- Radius resolve(MixData mix)
- get null props

Beginning of file: lib/src/core/dto/color_dto.dart

class ColorDto extends ModifiableDto
- ColorDto? maybeFrom(Color? color)
- ColorDto merge(ColorDto? other)
- Color resolve(MixData mix)
- get null props

Beginning of file: lib/src/core/dto/double_dto.dart

class DoubleAttribute extends StyleAttribute
- DoubleDto value
- DoubleAttribute merge(DoubleAttribute? other)
- double resolve(MixData mix)
- get List<Object?> props
class DoubleDto extends ModifiableDto
- DoubleDto? maybeFrom(double? value)
- DoubleDto merge(DoubleDto? other)
- double resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/core/dto/border_side_dto.dart

class BorderSideDto extends Dto
- ColorDto? color
- double? width
- BorderStyle? style
- double? strokeAlign
- Unknown _default
- BorderSideDto merge(BorderSideDto? other)
- BorderSide resolve(MixData mix)
- get null props

Beginning of file: lib/src/core/variants/variant.dart

class Variant
- String name
- VariantOperation &(Variant variant)
- VariantOperation |(Variant variant)
- VariantAttribute call()
- bool ==(Object other)
- String toString()
- get int hashCode

Beginning of file: lib/src/core/variants/context_variant.dart

class ContextVariant extends Variant
- ShouldApplyFunction _shouldApply
- get null props
- bool shouldApply(BuildContext context)
- ContextVariantAttribute call()

Beginning of file: lib/src/core/variants/variant_operation.dart

class VariantOperation
- List<Variant> variants
- EnumVariantOperator operator
- VariantOperation &(Variant variant)
- VariantOperation |(Variant variant)
- NestedStyleAttribute call()
- List<VariantAttribute> _buildOrOperations(List<Attribute> attributes)
- List<VariantAttribute> _buildAndOperations(List<Attribute> attributes)
- bool ==(Object other)
- String toString()
- get int hashCode

Beginning of file: lib/src/core/decorators/decorator.dart

class Decorator extends StyleAttribute
- Decorator merge(Decorator? other)
- Widget build(Widget child, MixData mix)

Beginning of file: lib/src/core/decorators/widget_decorator_wrapper.dart

class WidgetDecoratorWrapper extends StatelessWidget
- MixData mix
- Widget child
- Widget build(BuildContext context)

Beginning of file: lib/src/core/decorators/built_in_decorators/clip_decorator.dart

class ClipDecorator extends Decorator
- BorderRadiusAttribute? borderRadius
- ClipDecoratorType clipType
- ClipDecorator merge(ClipDecorator other)
- ClipDecoratorSpec resolve(MixData mix)
- get null props
- Widget build(Widget child, MixData mix)
class ClipDecoratorSpec extends Spec
- BorderRadiusGeometry borderRadius
- ClipDecoratorType clipType
- ClipDecoratorSpec lerp(ClipDecoratorSpec other, double t)
- ClipDecoratorSpec copyWith()
- get null props
class AnimatedClipRRect extends StatelessWidget
- Widget _builder(BuildContext context, BorderRadius radius, Widget? child)
- Duration duration
- Curve curve
- BorderRadius borderRadius
- Widget child
- Widget build(BuildContext context)
class TriangleClipper extends CustomClipper
- Path getClip(Size size)
- bool shouldReclip(TriangleClipper oldClipper)

Beginning of file: lib/src/core/decorators/built_in_decorators/rotate.dart

class RotateDecorator extends Decorator
- int quarterTurns
- RotateDecorator merge(RotateDecorator other)
- int resolve(MixData mix)
- get null props
- Widget build(Widget child, MixData mix)
class RotateSpec
- int quarterTurns

Beginning of file: lib/src/core/decorators/built_in_decorators/flexible.dart

class FlexibleDecorator extends Decorator
- int? _flex
- FlexFit? _flexFit
- FlexibleDecorator merge(FlexibleDecorator other)
- FlexibleDecoratorSpec resolve(MixData mix)
- get null props
- Widget build()
class FlexibleDecoratorSpec
- int flex
- FlexFit flexFit

Beginning of file: lib/src/core/decorators/built_in_decorators/aspect_ratio.dart

class AspectRatioDecorator extends Decorator
- DoubleDto _aspectRatio
- AspectRatioDecorator merge(AspectRatioDecorator other)
- double resolve(MixData mix)
- get null props
- Widget build(Widget child, MixData mix)

Beginning of file: lib/src/core/decorators/built_in_decorators/opacity.dart

class OpacityDecorator extends Decorator
- DoubleDto value
- OpacityDecorator merge(OpacityDecorator? other)
- double resolve(MixData mix)
- get null props
- Widget build()

Beginning of file: lib/src/core/decorators/built_in_decorators/scale.dart

class ScaleDecorator extends Decorator
- DoubleDto _scale
- ScaleDecorator merge(ScaleDecorator? other)
- double resolve(MixData mix)
- get null props
- Widget build(Widget child, MixData mix)

Beginning of file: lib/src/core/attribute.dart

class Dto with Comparable, Mergeable, Resolvable
class Attribute with Comparable, Mergeable
- get Object type
- T resolve(MixData mix)
- T merge(T? other)
- M mergeAttr(M? current, M? other)

Beginning of file: lib/src/deprecations.dart

- get SpreadPositionalParams<T, StyleMix> mix
- StyleMix withVariants(List<Variant> variants)
- StyleMix addAttributes(List<Attribute> attributes)
- StyleMix withManyVariants(List<Variant> variants)
- get SpreadPositionalParams<StyleMix, StyleMix> apply
- StyleMix withVariant(Variant variant)
- StyleMix combineAll(List<StyleMix> mixes)
- StyleMix withMaybeVariant(Variant? variant)
- StyleMix maybeApply(StyleMix? mix)
- StyleMix applyMaybe(StyleMix? mix)

Beginning of file: lib/src/utils/padding.util.dart


Beginning of file: lib/src/utils/container_util.dart


Beginning of file: lib/src/utils/height.util.dart


Beginning of file: lib/src/utils/gradient_util.dart


Beginning of file: lib/src/utils/border_util.dart


Beginning of file: lib/src/utils/margin_util.dart


Beginning of file: lib/src/utils/alignment_util.dart


Beginning of file: lib/src/utils/image_util.dart


Beginning of file: lib/src/utils/width_util.dart


Beginning of file: lib/src/utils/text_util.dart


Beginning of file: lib/src/utils/transform_util.dart


Beginning of file: lib/src/utils/pressable_util.dart


Beginning of file: lib/src/utils/box_constraints_util.dart


Beginning of file: lib/src/utils/visible_util.dart


Beginning of file: lib/src/utils/stack_fit_util.dart


Beginning of file: lib/src/utils/text_style_util.dart


Beginning of file: lib/src/utils/flex_util.dart


Beginning of file: lib/src/utils/padding_util.dart


Beginning of file: lib/src/utils/text_directives_util.dart


Beginning of file: lib/src/utils/image.util.dart


Beginning of file: lib/src/utils/text_direction_util.dart


Beginning of file: lib/src/utils/height_util.dart


Beginning of file: lib/src/utils/stack_util.dart


Beginning of file: lib/src/utils/helper_util.dart

class HelperUtility
- NestedStyleAttribute apply(List<StyleMix> mixes)
class SpreadNamedParams
- FunctionWithMapParam<ParamType, ReturnType> _function
- Map<String, dynamic> _initialParams
class SpreadPositionalParams
- FunctionWithListParam<ParamType, ReturnType> fn
- ReturnType call()

Beginning of file: lib/src/utils/context_variant_util.dart


Beginning of file: lib/src/utils/border_radius_util.dart


Beginning of file: lib/src/utils/icon_util.dart


Beginning of file: lib/src/utils/vertical_direction_util.dart


Beginning of file: lib/src/attributes/variant_attribute.dart

class VariantAttribute extends Attribute
- T variant
- StyleMix _style
- get MixValues value
- VariantAttribute<T> merge(VariantAttribute<T> other)
- String toString()
- get Key mergeKey
- get null props
class ContextVariantAttribute extends VariantAttribute
- bool shouldApply(BuildContext context)
- ContextVariantAttribute merge(ContextVariantAttribute other)

Beginning of file: lib/src/attributes/flex_fit_attribute.dart

class FlexFitAttribute extends StyleAttribute
- FlexFit fit
- FlexFitAttribute merge(FlexFitAttribute? other)
- FlexFit resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/image_attribute.dart

class ImageAttributes extends SpecAttribute
- ImageProviderAttribute? image
- WidthAttribute? width
- HeightAttribute? height
- ColorDto? color
- ImageRepeatAttribute? repeat
- BoxFitAttribute? fit
- ImageAttributes merge(ImageAttributes? other)
- ImageSpec resolve(MixData mix)
- get null props
class ImageSpec extends Spec
- ImageProvider? image
- double? width
- Color? color
- ImageRepeat? repeat
- BoxFit? fit
- ImageSpec lerp(ImageSpec? other, double t)
- ImageSpec copyWith()
- get null props

Beginning of file: lib/src/attributes/text_style_attribute.dart

class TextStyleAttribute extends StyleAttribute
- String? fontFamily
- FontWeight? fontWeight
- bool? inherit
- FontStyle? fontStyle
- double? fontSize
- double? letterSpacing
- double? wordSpacing
- TextBaseline? textBaseline
- ColorDto? color
- ColorDto? backgroundColor
- List<ShadowAttribute>? shadows
- List<FontFeature>? fontFeatures
- TextDecoration? decoration
- ColorDto? decorationColor
- TextDecorationStyle? decorationStyle
- Locale? locale
- String? debugLabel
- double? height
- Paint? foreground
- Paint? background
- double? decorationThickness
- List<String>? fontFamilyFallback
- TextStyleToken? styleToken
- TextStyleAttribute merge(TextStyleAttribute? other)
- TextStyle resolve(MixData mix)
- get null props

Beginning of file: lib/src/attributes/text_direction_attribute.dart

class TextDirectionAttribute extends StyleAttribute
- TextDirection direction
- TextDirectionAttribute? maybeFrom(TextDirection? direction)
- get TextDirection value
- TextDirectionAttribute merge(TextDirectionAttribute? other)
- TextDirection resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/common_attribute.dart

class CommonAttributes extends StyleAttribute
- DurationAttribute? _animationDuration
- CurveAttribute? _animationCurve
- TextDirectionAttribute? _textDirection
- VisibleAttribute? _visible
- CommonAttributes merge(CommonAttributes? other)
- CommonSpec resolve(MixData mix)
- get null props
class CommonSpec extends Spec
- bool visible
- TextDirection textDirection
- Duration animationDuration
- Curve animationCurve
- Unknown defaults
- CommonSpec copyWith()
- CommonSpec lerp(CommonSpec other, double t)
- get null props

Beginning of file: lib/src/attributes/vertical_direction_attribute.dart

class VerticalDirectionAttribute extends StyleAttribute
- VerticalDirection direction
- VerticalDirectionAttribute merge(VerticalDirectionAttribute? other)
- VerticalDirection resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/text_attribute.dart

class TextAttributes extends StyleAttribute
- List<TextDirective> _directives
- TextHeightBehavior? _textHeightBehavior
- int? _maxLines
- TextWidthBasis? _textWidthBasis
- double? _textScaleFactor
- TextOverflowAttribute? _overflow
- TextAlignAttribute? _textAlign
- bool? _softWrap
- Locale? _locale
- StrutStyleAttribute? _strutStyle
- List<TextStyleAttribute>? _styles
- TextDirectionAttribute? _textDirection
- TextAttributes merge(TextAttributes? other)
- TextSpec resolve(MixData mix)
- get null props
class TextSpec extends Spec
- bool softWrap
- TextOverflow overflow
- StrutStyle? strutStyle
- TextAlign? textAlign
- Locale? locale
- double? textScaleFactor
- int? maxLines
- TextWidthBasis? textWidthBasis
- TextHeightBehavior? textHeightBehavior
- TextStyle? style
- TextDirection? textDirection
- List<TextDirective> directives
- String applyTextDirectives(String? text)
- TextSpec lerp(TextSpec other, double t)
- TextSpec copyWith()
- get List<Object?> props

Beginning of file: lib/src/attributes/strut_style_attribute.dart

class StrutStyleAttribute extends StyleAttribute
- String? fontFamily
- List<String>? fontFamilyFallback
- double? fontSize
- FontWeight? fontWeight
- FontStyle? fontStyle
- double? height
- double? leading
- bool? forceStrutHeight
- Unknown _default
- StrutStyleAttribute? maybeFrom(StrutStyle? strutStyle)
- StrutStyleAttribute merge(StrutStyleAttribute? other)
- StrutStyle resolve(MixData mix)
- get null props

Beginning of file: lib/src/attributes/gradient_attribute.dart

class GradientAttribute extends StyleAttribute
- Gradient _gradient
- get Gradient value
- GradientAttribute merge(GradientAttribute? other)
- Gradient resolve(MixData mix)
- get null props

Beginning of file: lib/src/attributes/main_axis_alignment_attribute.dart

class MainAxisAlignmentAttribute extends StyleAttribute
- MainAxisAlignment alignment
- MainAxisAlignmentAttribute merge(MainAxisAlignmentAttribute? other)
- MainAxisAlignment resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/visible_attribute.dart

class VisibleAttribute extends StyleAttribute
- bool _visible
- VisibleAttribute merge(VisibleAttribute? other)
- bool resolve(MixData mix)
- get null props

Beginning of file: lib/src/attributes/box_fit_attribute.dart

class BoxFitAttribute extends StyleAttribute
- BoxFit fit
- BoxFitAttribute merge(BoxFitAttribute? other)
- BoxFit resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/cross_axis_alignment_attribute.dart

class CrossAxisAlignmentAttribute extends StyleAttribute
- CrossAxisAlignment alignment
- CrossAxisAlignmentAttribute merge(CrossAxisAlignmentAttribute? other)
- CrossAxisAlignment resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/matrix4_attribute.dart

class Matrix4Attribute extends StyleAttribute
- Matrix4 matrix
- Matrix4 resolve(MixData mix)
- Matrix4Attribute merge(Matrix4Attribute? other)
- get null props

Beginning of file: lib/src/attributes/image_provider_attribute.dart

class ImageProviderAttribute extends StyleAttribute
- ImageProviderAttribute<T> merge(ImageProviderAttribute<T>? other)
- T resolve(MixData mix)
class NetworkImageAttribute extends ImageProviderAttribute
- String imageUrl
- NetworkImageAttribute merge(NetworkImageAttribute? other)
- NetworkImage resolve(MixData mix)
- get List<Object?> props
class AssetImageAttribute extends ImageProviderAttribute
- String assetName
- AssetImageAttribute merge(AssetImageAttribute? other)
- AssetImage resolve(MixData mix)
- get List<Object?> props
class FileImageAttribute extends ImageProviderAttribute
- File file
- FileImageAttribute merge(FileImageAttribute? other)
- FileImage resolve(MixData mix)
- get List<Object?> props
class MemoryImageAttribute extends ImageProviderAttribute
- Uint8List bytes
- MemoryImageAttribute merge(MemoryImageAttribute? other)
- MemoryImage resolve(MixData mix)
- get List<Object?> props
class ExactAssetImageAttribute extends ImageProviderAttribute
- String assetName
- double scale
- ExactAssetImageAttribute merge(ExactAssetImageAttribute? other)
- ExactAssetImage resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/flex_attribute.dart

class FlexAttributes extends SpecAttribute
- AxisAttribute? direction
- MainAxisAlignmentAttribute? mainAxisAlignment
- CrossAxisAlignmentAttribute? crossAxisAlignment
- MainAxisSizeAttribute? mainAxisSize
- VerticalDirectionAttribute? verticalDirection
- TextDirectionAttribute? textDirection
- TextBaselineAttribute? textBaseline
- ClipAttribute? clipBehavior
- FlexAttributes merge(FlexAttributes? other)
- FlexSpec resolve(MixData mix)
- get List<Object?> props
class FlexSpec extends Spec
- Axis? direction
- MainAxisAlignment? mainAxisAlignment
- CrossAxisAlignment? crossAxisAlignment
- MainAxisSize? mainAxisSize
- VerticalDirection? verticalDirection
- TextDirection? textDirection
- TextBaseline? textBaseline
- Clip? clipBehavior
- FlexSpec lerp(FlexSpec other, double t)
- FlexSpec copyWith()
- get List<Object?> props

Beginning of file: lib/src/attributes/style_attribute.dart

class StyleAttribute extends Attribute with Resolvable
- K? resolveAttr(R? resolvable, MixData mix)
- K? resolveDto(R? resolvable, MixData mix)
- List<M> combinedAttrList(List<M>? current, List<M>? other)
- List<M> mergeAttrList(List<M>? current, List<M>? other)
- M mergeAttr(M? current, M? other)
class ModifiableDto extends Dto
- T value
- ValueModifier<T>? modifier
- T modify(T valueToModify)
class SpecAttribute extends StyleAttribute
class Spec extends ThemeExtension with Comparable
- Duration lerpDuration(Duration a, Duration b, double t)
- int lerpInt(int a, int b, double t)
- N? genericNumLerp(N? a, N? b, double t)
- P snap(P from, P to, double t)
- List<T> resolveAll(MixData mix)

Beginning of file: lib/src/attributes/box_border_attribute.dart

class BoxBorderAttribute extends StyleAttribute
- BorderSideDto? _top
- BorderSideDto? _right
- BorderSideDto? _bottom
- BorderSideDto? _left
- BorderSideDto? _start
- BorderSideDto? _end
- get BorderSideDto? top
- get BorderSideDto? right
- get BorderSideDto? bottom
- get BorderSideDto? left
- get BorderSideDto? start
- get BorderSideDto? end
- get bool _isDirectional
- BoxBorderAttribute merge(BoxBorderAttribute? other)
- BoxBorder resolve(MixData mix)
- get null props

Beginning of file: lib/src/attributes/duration_attribute.dart

class DurationAttribute extends StyleAttribute
- Duration duration
- DurationAttribute merge(DurationAttribute? other)
- Duration resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/shadow_attribute.dart

class ShadowAttribute extends StyleAttribute
- ColorDto? color
- Offset? offset
- double? blurRadius
- T resolve(MixData mix)
- ShadowAttribute merge(ShadowAttribute? other)
- get null props

Beginning of file: lib/src/attributes/curve_attribute.dart

class CurveAttribute extends StyleAttribute
- Curve curve
- CurveAttribute merge(CurveAttribute? other)
- Curve resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/alignment_geometry_attribute.dart

class AlignmentGeometryAttribute extends StyleAttribute
- AlignmentGeometryAttribute? maybeFrom(AlignmentGeometry? alignment)
- AlignmentGeometryAttribute from(AlignmentGeometry alignment)
- AlignmentGeometryAttribute<T> merge(AlignmentGeometryAttribute<T>? other)
- T resolve(MixData mix)
class AlignmentAttribute extends AlignmentGeometryAttribute
- double? x
- double? y
- AlignmentAttribute merge(AlignmentAttribute? other)
- Alignment resolve(MixData mix)
- get null props
class AlignmentDirectionalAttribute extends AlignmentGeometryAttribute
- double? start
- double? y
- AlignmentDirectionalAttribute merge(AlignmentDirectionalAttribute? other)
- AlignmentDirectional resolve(MixData mix)
- get null props

Beginning of file: lib/src/attributes/box_shadow_attribute.dart

class BoxShadowAttribute extends ShadowAttribute
- double? spreadRadius
- BoxShadow resolve(MixData mix)
- BoxShadowAttribute merge(BoxShadowAttribute? other)
- get null props

Beginning of file: lib/src/attributes/clip_attribute.dart

class ClipAttribute extends StyleAttribute
- Clip clip
- ClipAttribute merge(ClipAttribute? other)
- Clip resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/border_radius_geometry_attribute.dart

class BorderRadiusGeometryAttribute extends StyleAttribute
- BorderRadiusGeometryAttribute from(BorderRadiusGeometry borderRadius)
- BorderRadiusGeometryAttribute<T> merge(BorderRadiusGeometryAttribute<T>? other)
- T resolve(MixData mix)
class BorderRadiusAttribute extends BorderRadiusGeometryAttribute
- RadiusDto? topLeft
- RadiusDto? topRight
- RadiusDto? bottomLeft
- RadiusDto? bottomRight
- BorderRadiusAttribute merge(BorderRadiusAttribute? other)
- BorderRadius resolve(MixData mix)
- get null props
class BorderRadiusDirectionalAttribute extends BorderRadiusGeometryAttribute
- Unknown zero
- RadiusDto? topStart
- RadiusDto? topEnd
- RadiusDto? bottomStart
- RadiusDto? bottomEnd
- BorderRadiusDirectionalAttribute merge(BorderRadiusDirectionalAttribute? other)
- BorderRadiusDirectional resolve(MixData mix)
- get null props

Beginning of file: lib/src/attributes/text_overflow_attribute.dart

class TextOverflowAttribute extends StyleAttribute
- TextOverflow overflow
- TextOverflowAttribute? maybeFrom(TextOverflow? overflow)
- TextOverflowAttribute merge(TextOverflowAttribute? other)
- TextOverflow resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/axis_attribute.dart

class AxisAttribute extends StyleAttribute
- Axis axis
- AxisAttribute merge(AxisAttribute? other)
- Axis resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/image_repeat_attribute.dart

class ImageRepeatAttribute extends StyleAttribute
- ImageRepeat imageRepeat
- ImageRepeatAttribute merge(ImageRepeatAttribute? other)
- ImageRepeat resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/box_constraints_attribute.dart

class BoxConstraintsAttribute extends StyleAttribute
- double? minWidth
- double? maxWidth
- double? minHeight
- double? maxHeight
- BoxConstraintsAttribute merge(BoxConstraintsAttribute? other)
- BoxConstraints resolve(MixData mix)
- get null props

Beginning of file: lib/src/attributes/stack_fit_attribute.dart

class StackFitAttribute extends StyleAttribute
- StackFit fit
- StackFitAttribute merge(StackFitAttribute? other)
- StackFit resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/container_attribute.dart

class ContainerAttributes extends SpecAttribute
- AlignmentGeometryAttribute? alignment
- PaddingAttribute? padding
- MarginAttribute? margin
- BoxConstraintsAttribute? constraints
- DecorationAttribute? decoration
- WidthAttribute? width
- HeightAttribute? height
- Matrix4Attribute? transform
- BackgroundColorAttribute? color
- ClipAttribute? clipBehavior
- ContainerAttributes merge(ContainerAttributes? other)
- ContainerSpec resolve(MixData mix)
- get List<Object?> props
class ContainerSpec extends Spec
- AlignmentGeometry? alignment
- EdgeInsetsGeometry? padding
- EdgeInsetsGeometry? margin
- BoxConstraints? constraints
- Decoration? decoration
- double? width
- double? height
- Matrix4? transform
- Color? color
- Clip? clipBehavior
- ContainerSpec copyWith()
- ContainerSpec lerp(ContainerSpec other, double t)
- get null props

Beginning of file: lib/src/attributes/nested_attribute.dart

class NestedStyleAttribute extends Attribute
- StyleMix style
- NestedStyleAttribute merge(NestedStyleAttribute? other)
- get null props

Beginning of file: lib/src/attributes/size_attribute.dart

class HeightAttribute extends DoubleAttribute
- HeightAttribute merge(HeightAttribute? other)
class WidthAttribute extends DoubleAttribute
- WidthAttribute merge(WidthAttribute? other)

Beginning of file: lib/src/attributes/text_align_attribute.dart

class TextAlignAttribute extends StyleAttribute
- TextAlign align
- TextAlignAttribute? maybeFrom(TextAlign? align)
- TextAlignAttribute merge(TextAlignAttribute? other)
- TextAlign resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/color_attribute.dart

class ColorAttribute extends StyleAttribute
- ColorDto color
- ColorAttribute merge(ColorAttribute? other)
- Color resolve(MixData mix)
- get null props
class BackgroundColorAttribute extends ColorAttribute
- BackgroundColorAttribute merge(BackgroundColorAttribute? other)

Beginning of file: lib/src/attributes/decoration_attribute.dart

class DecorationAttribute extends StyleAttribute
- DecorationAttribute from(Decoration decoration)
- DecorationAttribute<T> merge(DecorationAttribute<T>? other)
class BoxDecorationAttribute extends DecorationAttribute
- ColorDto? color
- BoxBorderAttribute? border
- BorderRadiusGeometryAttribute? borderRadius
- GradientAttribute? gradient
- List<BoxShadowAttribute>? boxShadow
- BoxShape? shape
- BoxDecorationAttribute merge(BoxDecorationAttribute? other)
- BoxDecoration resolve(MixData mix)
- get null props
class ShapeDecorationAttribute extends DecorationAttribute
- ColorDto? color
- ShapeBorder? shape
- GradientAttribute? gradient
- List<BoxShadowAttribute>? boxShadow
- ShapeDecorationAttribute merge(ShapeDecorationAttribute? other)
- ShapeDecoration resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/space_attribute.dart

class PaddingAttribute extends StyleAttribute
- double? _top
- double? _bottom
- double? _left
- double? _right
- double? _start
- double? _end
- get double? top
- get double? bottom
- get double? left
- get double? right
- get double? start
- get double? end
- get bool _isDirectional
- PaddingAttribute merge(PaddingAttribute? other)
- EdgeInsetsGeometry resolve(MixData mix)
- get null props
class MarginAttribute extends StyleAttribute
- double? _top
- double? _bottom
- double? _left
- double? _right
- double? _start
- double? _end
- get double? top
- get double? bottom
- get double? left
- get double? right
- get double? start
- get double? end
- get bool _isDirectional
- MarginAttribute merge(MarginAttribute? other)
- EdgeInsetsGeometry resolve(MixData mix)
- get null props

Beginning of file: lib/src/attributes/text_baseline_attribute.dart

class TextBaselineAttribute extends StyleAttribute
- TextBaseline baseline
- TextBaselineAttribute merge(TextBaselineAttribute? other)
- TextBaseline resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/stack_attribute.dart

class StackAttributes extends SpecAttribute
- AlignmentGeometryAttribute? alignment
- StackFitAttribute? fit
- TextDirectionAttribute? textDirection
- ClipAttribute? clipBehavior
- StackAttributes merge(StackAttributes? other)
- StackSpec resolve(MixData mix)
- get List<Object?> props
class StackSpec extends Spec
- AlignmentGeometry? alignment
- StackFit? fit
- TextDirection? textDirection
- Clip? clipBehavior
- StackSpec lerp(StackSpec other, double t)
- StackSpec copyWith()
- get List<Object?> props

Beginning of file: lib/src/attributes/main_axis_size_attribute.dart

class MainAxisSizeAttribute extends StyleAttribute
- MainAxisSize size
- MainAxisSizeAttribute merge(MainAxisSizeAttribute? other)
- MainAxisSize resolve(MixData mix)
- get List<Object?> props

Beginning of file: lib/src/attributes/icon_attribute.dart

class IconAttributes extends StyleAttribute
- ColorDto? color
- DoubleDto? size
- IconData? icon
- IconAttributes merge(IconAttributes? other)
- IconSpec resolve(MixData mix)
- get List<Object?> props
class IconSpec extends Spec
- Color? color
- double? size
- IconData? icon
- IconSpec lerp(IconSpec other, double t)
- IconSpec copyWith()
- get null props

Beginning of file: lib/src/theme/material_theme/material_tokens.dart

class MaterialTextThemeTokens
- Unknown displayLarge
- Unknown displayMedium
- Unknown displaySmall
- Unknown headlineLarge
- Unknown headlineMedium
- Unknown headlineSmall
- Unknown titleLarge
- Unknown titleMedium
- Unknown titleSmall
- Unknown bodyLarge
- Unknown bodyMedium
- Unknown bodySmall
- Unknown labelLarge
- Unknown labelMedium
- Unknown labelSmall
- Unknown headline1
- Unknown headline2
- Unknown headline3
- Unknown headline4
- Unknown headline5
- Unknown headline6
- Unknown subtitle1
- Unknown subtitle2
- Unknown bodyText1
- Unknown bodyText2
- Unknown caption
- Unknown button
- Unknown overline
class MaterialColorSchemeTokens
- Unknown primary
- Unknown secondary
- Unknown tertiary
- Unknown surface
- Unknown background
- Unknown error
- Unknown onPrimary
- Unknown onSecondary
- Unknown onTertiary
- Unknown onSurface
- Unknown onBackground
- Unknown onError
class MaterialTokens
- Unknown textTheme
- Unknown colorScheme

Beginning of file: lib/src/theme/material_theme/color_scheme_tokens.dart

class $MDColorScheme
- Unknown primary
- Unknown secondary
- Unknown tertiary
- Unknown surface
- Unknown background
- Unknown error
- Unknown onPrimary
- Unknown onSecondary
- Unknown onTertiary
- Unknown onSurface
- Unknown onBackground
- Unknown onError
- get MixColorTokens tokens

Beginning of file: lib/src/theme/material_theme/text_theme_tokens.dart

class $M3Text
- Unknown displayLarge
- Unknown displayMedium
- Unknown displaySmall
- Unknown headlineLarge
- Unknown headlineMedium
- Unknown headlineSmall
- Unknown titleLarge
- Unknown titleMedium
- Unknown titleSmall
- Unknown bodyLarge
- Unknown bodyMedium
- Unknown bodySmall
- Unknown labelLarge
- Unknown labelMedium
- Unknown labelSmall
- get MixTextStyleTokens tokens
class $M2Text
- Unknown headline1
- Unknown headline2
- Unknown headline3
- Unknown headline4
- Unknown headline5
- Unknown headline6
- Unknown subtitle1
- Unknown subtitle2
- Unknown bodyText1
- Unknown bodyText2
- Unknown caption
- Unknown button
- Unknown overline
- get MixTextStyleTokens tokens

Beginning of file: lib/src/theme/mix_theme.dart

class MixTheme extends InheritedWidget
- MixThemeData of(BuildContext context)
- MixThemeData? maybeOf(BuildContext context)
- MixThemeData data
- bool updateShouldNotify(MixTheme oldWidget)
class MixThemeData with Comparable
- MixSpaceTokens space
- MixBreakpointsTokens breakpoints
- MixColorTokens colors
- MixTextStyleTokens textStyles
- MixThemeData copyWith()
- get null props
class BuildContextResolver
- BuildContext context
- get MixThemeData theme
- get TextDirection directionality
- Color color(ColorToken token)
- TextStyle textStyle(TextStyleToken token)
- double space(double value)

Beginning of file: lib/src/theme/token_alias.dart

class _SpaceTokensRef
- Unknown instance
- Unknown xsmall
- Unknown small
- Unknown medium
- Unknown large
- Unknown xlarge
- Unknown xxlarge

Beginning of file: lib/src/theme/tokens/text_style_token.dart

class TextStyleToken extends TextStyle
- String name
- bool ==(Object other)
- get int hashCode

Beginning of file: lib/src/theme/tokens/color_token.dart

class ColorSwatchToken extends ColorSwatch
- String name
- bool ==(Object other)
- get int hashCode
class ColorToken extends Color
- String name
- bool ==(Object other)
- get int hashCode

Beginning of file: lib/src/theme/tokens/mix_token.dart

class MixToken
- String name
- bool ==(Object other)
- get int hashCode
- get double ref
- double call()

Beginning of file: lib/src/theme/tokens/breakpoints.dart

class MixBreakpointsTokens
- double xsmall
- double small
- double medium
- double large
- ScreenSizeToken getScreenSize(BuildContext context)
- MixBreakpointsTokens copyWith()
- bool ==(Object other)
- String toString()
- get int hashCode

Beginning of file: lib/src/theme/tokens/radii_token.dart

class RadiiToken extends MixToken with WithReferenceMixin

Beginning of file: lib/src/theme/tokens/space_token.dart

class SpaceTokens
- Unknown xsmall
- Unknown small
- Unknown medium
- Unknown large
- Unknown xlarge
- Unknown xxlarge
- get MixSpaceTokens tokens
class SpaceToken extends MixToken with WithReferenceMixin
class WrapWithSpaceTokens
- T Function(double value) _fn
- get T xsmall
- get T small
- get T medium
- get T large
- get T xlarge
- get T xxlarge
- get T md
- get T sm
- get T lg
- get T xl
- get T xs
- get T xxl
- T call(double value)

Beginning of file: lib/src/deprecated_alias.dart

class LegacyTextStyleUtility
- TextStyle textShadow(List<Shadow> shadows)
- TextStyle fontWeight(FontWeight weight)
- TextStyle textBaseline(TextBaseline baseline)
- TextStyle letterSpacing(double spacing)
- TextStyle debugLabel(String label)
- TextStyle textHeight(double height)
- TextStyle wordSpacing(double spacing)
- TextStyle fontStyle(FontStyle style)
- TextStyle fontSize(double size)
- TextStyle inherit(bool value)
- TextStyle textColor(Color color)
- TextStyle textBgColor(Color backgroundColor)
- TextStyle textForeground(Paint foreground)
- TextStyle textBackground(Paint background)
- TextStyle fontFeatures(List<FontFeature> features)
- TextStyle textDecoration(TextDecoration decoration)
- TextStyle textDecorationColor(Color decorationColor)
- TextStyle textDecorationStyle(TextDecorationStyle decorationStyle)
- TextStyle textDecorationThickness(double decorationThickness)
- TextStyle fontFamilyFallback(List<String> fontFamilyFallback)

Beginning of file: lib/src/helpers/deep_collection_equality.dart

class DeepCollectionEquality
- bool equals(Object? object1, Object? object2)
- int hash(Object? object)
- bool _compareLists(List list1, List list2)
- bool _compareSets(Set set1, Set set2)
- bool _compareMaps(Map map1, Map map2)

Beginning of file: lib/src/helpers/compare_mixin.dart

- get List<Object?> props
- get bool stringify
- bool ==(Object other)
- get int hashCode
- List<String> getDiff(Object other)
- String toString()

Beginning of file: lib/src/helpers/logger.dart

class Logger
- String tag
- Unknown stopwatch
- void start()
- void stop()
- void debug(String message)

Beginning of file: lib/src/helpers/extensions/build_context_ext.dart

- get MixData? mix
- get TextDirection directionality
- get Orientation orientation
- get Size screenSize
- get Brightness brightness
- get ThemeData theme
- get ColorScheme colorScheme
- get TextTheme textTheme
- get MixThemeData mixTheme
- get bool isDarkMode
- get bool isLandscape
- get bool isPortrait

Beginning of file: lib/src/helpers/extensions/style_mix_ext.dart

- StyledContainer container()
- StyledContainer box()
- HBox hbox()
- StyledRow row()
- StyledText text(String text)
- VBox vbox()
- StyledColumn column()
- StyledIcon icon(IconData icon)

Beginning of file: lib/src/helpers/extensions/string_ext.dart

- get List<String> words
- get bool isUpperCase
- get bool isLowerCase
- get String camelCase
- get String pascalCase
- get String capitalize
- get String constantCase
- get String snakeCase
- get String paramCase
- get String titleCase
- get String sentenceCase
- get List<String> lowercase
- get List<String> uppercase

Beginning of file: lib/src/helpers/extensions/helper_ext.dart

- StrutStyle merge(StrutStyle? other)
- Matrix4 merge(Matrix4? other)
- Iterable<T> sorted()
- T? firstWhereOrNull(bool Function(T) test)

Beginning of file: lib/src/helpers/attributes_map.dart

class StylesMap extends MergeableMap
- Unknown empty
- Set<Spec> buildSpecs(MixData context)
- StylesMap merge(StylesMap? other)
class VariantAttributeMap extends MergeableMap
- Unknown empty
- get List<VariantAttribute> namedVariants
- get List<ContextVariantAttribute> contextVariants
- VariantAttributeMap merge(VariantAttributeMap? other)
class MergeableMap with Comparable
- LinkedHashMap<K, T>? _map
- get LinkedHashMap<K, T> map
- get int length
- get bool isEmpty
- get bool isNotEmpty
- get Iterable<T> values
- Iterable<R> whereType()
- Iterable<R> whereRuntimeType()
- LinkedHashMap<K, T> mergeMap(LinkedHashMap<K, T>? otherMap)
- MergeableMap<K, T> merge(MergeableMap<K, T>? other)
- get List<Object> props

Beginning of file: lib/src/helpers/color_helpers.dart

- get Color value
- Color darken()
- Color lighten()
- Color fromHex(String hexString)
- String toHex()

Beginning of file: lib/src/helpers/constants.dart


Beginning of file: lib/src/factory/style_group.dart

class StyleGroup
- StyleGroup<T> merge(StyleGroup<T>? other)
- StyleGroup<T> selectVariants(List<Variant> variants)
- StyleGroup<T> copyWith()

Beginning of file: lib/src/factory/mix_provider.dart

class MixProvider extends InheritedWidget
- MixData? maybeOf(BuildContext context)
- MixData of(BuildContext context)
- MixData? data
- bool updateShouldNotify(MixProvider oldWidget)

Beginning of file: lib/src/factory/mix_values.dart

class MixValues with Comparable
- Unknown empty
- StylesMap styles
- VariantAttributeMap variants
- get bool hasVariants
- get bool hasContextVariants
- get bool hasStyles
- get bool hasDecorators
- get bool isEmpty
- get bool isNotEmpty
- get int length
- get List<ContextVariantAttribute> _contextVariants
- get List<Decorator> _decorators
- A? stylesOfType()
- Iterable<Attribute> toValues()
- MixValues copyWith()
- MixValues merge(MixValues? other)
- get null props

Beginning of file: lib/src/factory/style_mix.dart

class StyleMix
- Unknown empty
- MixValues _values
- get MixValues values
- Iterable<Attribute> toAttributes()
- StyleMix copyWith()
- StyleMix merge(StyleMix mix)
- StyleMix mergeMany(List<StyleMix> mixes)
- StyleMix mergeNullable(StyleMix? style)
- StyleMix selectVariant(Variant variant)
- StyleMix selectVariants(List<Variant> variants)
- StyleMix pickVariants(List<Variant> variants)
- StyleMix selectVariantCondition(Map<bool, Variant> cases)
- bool ==(Object other)
- get int hashCode

Beginning of file: lib/src/factory/exports.dart


Beginning of file: lib/src/factory/mix_provider_data.dart

class MixData with Comparable
- bool animated
- StylesMap _styles
- BuildContextResolver _resolver
- get BuildContextResolver resolver
- get TextDirection directionality
- get CommonSpec commonSpec
- get List<Decorator> decorators
- List<T> whereDecoratorsOfType()
- A? attributeOf()
- R? maybeGet()
- R get(R defaultValue)
- S spec()
- T dependOnAttributesOf()
- MixData merge(MixData other)
- get null props

Beginning of file: lib/src/widgets/container_widget.dart

class StyledContainer extends StyledWidget
- Widget? child
- Widget build(BuildContext context)
class MixedContainer extends StatelessWidget
- Widget? child
- bool animated
- Widget build(BuildContext context)

Beginning of file: lib/src/widgets/empty_widget.dart

class Empty extends StatelessWidget
- Widget build(BuildContext context)

Beginning of file: lib/src/widgets/stack_widget.dart

class StyledStack extends StyledWidget
- List<Widget> children
- Widget build(BuildContext context)
class ZBox extends StyledWidget
- List<Widget> children
- Widget build(BuildContext context)
class MixedStack extends StatelessWidget
- List<Widget> children
- Widget build(BuildContext context)

Beginning of file: lib/src/widgets/styled_widget.dart

class StyledWidgetBuilder
- Widget build(BuildContext context, MixData mix)
class StyledWidget extends StatelessWidget
- StyleMix? _style
- List<Variant>? _variants
- bool _inherit
- get StyleMix style
- get List<Variant>? variants
- MixData getMix(BuildContext context)
- Widget withMix(BuildContext context, Widget child)
- Widget withMixBuilder(BuildContext context, WidgetMixBuilder builder)
- void debugFillProperties(DiagnosticPropertiesBuilder properties)
- Widget build(BuildContext context)

Beginning of file: lib/src/widgets/icon_widget.dart

class StyledIcon extends StyledWidget
- IconData? icon
- String? semanticLabel
- Widget build(BuildContext context)
class MixedIcon extends StatelessWidget
- IconData? icon
- String? semanticLabel
- Widget build(BuildContext context)

Beginning of file: lib/src/widgets/pressable/pressable_widget.dart

class Pressable extends StatefulWidget
- Widget child
- VoidCallback? onPressed
- VoidCallback? onLongPress
- FocusNode? focusNode
- bool autofocus
-  Function(bool focus)? onFocusChange
- HitTestBehavior? behavior
- _PressableWidgetState createState()
class _PressableWidgetState extends State
- FocusNode _node
- void initState()
- FocusNode _createFocusNode()
- void didUpdateWidget(Pressable oldWidget)
- void dispose()
- bool _hover
- bool _focus
- bool _pressed
- bool _longpressed
- get bool _onEnabled
- get PressableState _state
- void handleUnpress()
- null updateState(void Function() fn)
- Widget build(BuildContext context)

Beginning of file: lib/src/widgets/pressable/pressable_state.dart


Beginning of file: lib/src/widgets/pressable/pressable.notifier.dart

class PressableNotifier extends InheritedWidget
- PressableNotifier? of(BuildContext context)
- PressableState state
- bool focus
- bool updateShouldNotify(PressableNotifier oldWidget)

Beginning of file: lib/src/widgets/mix_context_builder.dart

class MixBuilder extends StyledWidget
- WidgetMixBuilder _builder
- Widget build(BuildContext context)

Beginning of file: lib/src/widgets/flex_widget.dart

class StyledFlex extends StyledWidget
- List<Widget> children
- Axis direction
- Widget build(BuildContext context)
class FlexBox extends StyledWidget
- List<Widget> children
- Axis direction
- Widget build(BuildContext context)
class StyledRow extends StyledFlex
class StyledColumn extends StyledFlex
class HBox extends FlexBox
class VBox extends FlexBox
class MixedFlex extends StatelessWidget
- List<Widget> children
- Axis direction
- List<Widget> _prepareChildrenWithGap()
- Widget build(BuildContext context)

Beginning of file: lib/src/widgets/text_widget.dart

class StyledText extends StyledWidget
- String text
- String? semanticsLabel
- Widget build(BuildContext context)
class MixedText extends StatelessWidget
- String content
- String? semanticsLabel
- void debugFillProperties(DiagnosticPropertiesBuilder properties)
- Widget build(BuildContext context)
