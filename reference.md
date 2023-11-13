### `Container` Widget

1. `alignment`: AlignmentGeometry
2. `padding`: EdgeInsetsGeometry
3. `color`: Color
4. `decoration`: Decoration
5. `foregroundDecoration`: Decoration
6. `width`: double
7. `height`: double
8. `constraints`: BoxConstraints
9. `margin`: EdgeInsetsGeometry
10. `transform`: Matrix4
11. `transformAlignment`: AlignmentGeometry

### `Text` Widget

1. `style`: TextStyle
2. `textAlign`: TextAlign
3. `textDirection`: TextDirection
4. `softWrap`: bool
5. `overflow`: TextOverflow
6. `textScaleFactor`: double
7. `maxLines`: int
8. `semanticsLabel`: String
9. `textWidthBasis`: TextWidthBasis
10. `textHeightBehavior`: TextHeightBehavior

### `Icon` Widget

1. `icon`: IconData
2. `size`: double
3. `color`: Color
4. `semanticLabel`: String
5. `textDirection`: TextDirection

### `Image` Widget

1. `image`: ImageProvider<Object>
2. `width`: double
3. `height`: double
4. `color`: Color
5. `colorBlendMode`: BlendMode
6. `fit`: BoxFit
7. `alignment`: AlignmentGeometry
8. `repeat`: ImageRepeat
9. `centerSlice`: Rect
10. `matchTextDirection`: bool
11. `gaplessPlayback`: bool

### `Flex` Widget

1. `direction`: Axis
2. `mainAxisAlignment`: MainAxisAlignment
3. `mainAxisSize`: MainAxisSize
4. `crossAxisAlignment`: CrossAxisAlignment
5. `textDirection`: TextDirection
6. `verticalDirection`: VerticalDirection

### `Stack` Widget

1. `alignment`: AlignmentGeometry
2. `textDirection`: TextDirection
3. `fit`: StackFit
4. `clipBehavior`: Clip
5. `children`: List<Widget>

### Shared Properties

1. `alignment`: AlignmentGeometry - Shared by `Container`, `Image`, `Flex`, and `Stack`.
2. `textDirection`: TextDirection - Shared by `Text`, `Icon`, `Flex`, and `Stack`.
3. `color`: Color - Shared by `Container`, `Icon`, and `Image`.

### `TextStyle` Properties

1. `background`: Paint?
2. `backgroundColor`: Color?
3. `color`: Color?
4. `debugLabel`: String?
5. `decoration`: TextDecoration?
6. `decorationColor`: Color?
7. `decorationStyle`: TextDecorationStyle?
8. `decorationThickness`: double?
9. `fontFamily`: String?
10. `fontFamilyFallback`: List<String>?
11. `fontFeatures`: List<FontFeature>?
12. `fontSize`: double?
13. `fontStyle`: FontStyle?
14. `fontVariations`: List<FontVariation>?
15. `fontWeight`: FontWeight?
16. `foreground`: Paint?
17. `hashCode`: int (read-only, inherited)
18. `height`: double?
19. `inherit`: bool
20. `leadingDistribution`: TextLeadingDistribution?
21. `letterSpacing`: double?
22. `locale`: Locale?
23. `overflow`: TextOverflow?
24. `runtimeType`: Type (read-only, inherited)
25. `shadows`: List<Shadow>?
26. `textBaseline`: TextBaseline?
27. `wordSpacing`: double?
