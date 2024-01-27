# Box Utilities

## width

Sets the width of the box.

```dart
width(200)
```

## height

Sets the height of the box.

```dart
height(100)
```

## padding

Sets the padding of the box.

```dart
padding(10);

padding(10, 20);

padding(10, 20, 30);

padding(10, 20, 30, 40);
```

### padding.all

Sets the padding of the box on all sides.

```dart
padding.all(10)
```

### padding.top

Sets the padding of the box on the top side.

```dart
padding.top(10)
```

### padding.bottom

Sets the padding of the box on the bottom side.

```dart
padding.bottom(10)
```

### padding.left

Sets the padding of the box on the left side.

```dart
padding.left(10)
```

### padding.right

Sets the padding of the box on the right side.

```dart
padding.right(10)
```

### padding.horizontal

Sets the padding of the box on the horizontal (left and right) sides.

```dart
padding.horizontal(10)
```

### padding.vertical

Sets the padding of the box on the vertical (top and bottom) sides.

```dart
padding.vertical(10)
```

### padding.only

Sets the padding of the box on the specified sides.

```dart
padding.only(
    top: 10,
    bottom: 20,
    left: 30,
    right: 40
);
```

## Constraints

### maxWidth

Sets the maximum width the box can have.

```dart
maxWidth(200)
```

### minWidth

Sets the minimum width the box must have.

```dart
minWidth(100)
```

### maxHeight

Sets the maximum height the box can have.

```dart
maxHeight(200)
```

### minHeight

Sets the minimum height the box must have.

```dart
minHeight(100)
```

## backgroundColor

Sets the background color of the box.

```dart
backgroundColor(Colors.blue)
backgroundColor.blue()
```

## elevation

Sets the elevation of the box.

```dart
// Elevation can be 0, 1, 2, 3, 4, 6, 8, 9, 12, 16, 24
elevation(2)
```

## alignment

Sets the alignment of the box.

```dart
// You can pass the alignment into the utility
alignment(Alignment.center);

// Or you can use the alignment utility
alignment.center();
alignment.centerLeft();
alignment.centerRight();
alignment.topLeft();
alignment.topCenter();
alignment.topRight();
alignment.bottomLeft();
alignment.bottomCenter();
alignment.bottomRight();
```

## clipBehavior

Sets the clip behavior of the box.

```dart
// You can pass the clip into the utility
clipBehavior(Clip.hardEdge)
clipBehavior.none();
clipBehavior.hardEdge();
clipBehavior.antiAlias();
clipBehavior.antiAliasWithSaveLayer();
```
