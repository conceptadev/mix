## Decoration

### border

Defines the border of a Box. Equivalent to `BoxDecoration.border`, in a `Container`

#### call()

Styles all sides of `Border`.

```dart
border(
    color: Colors.red,
    width: 2,
    style: BorderStyle.solid,
    strokeAlign: 0.5
);
```

#### border.all

Styles all sides of `Border`.

```dart
border.all.color.red();
border.all.width(2);
border.all.style.solid();
border.all.strokeAlign(0.5);
```

#### border.top

Styles the top side of `Border`.

```dart
border.top.color.red();
border.top.width(2);
border.top.style.solid();
border.top.strokeAlign(0.5);
```

#### border.bottom

Styles the bottom side of `Border`.

```dart
border.bottom.color.red();
border.bottom.width(2);
border.bottom.style.solid();
border.bottom.strokeAlign(0.5);
```

#### border.left

Styles the left side of `Border`.

```dart
border.left.color.red();
border.left.width(2);
border.left.style.solid();
border.left.strokeAlign(0.5);
```

#### border.right

Styles the right side`Border`.

```dart
border.right.color.red();
border.right.width(2);
border.right.style.solid();
border.right.strokeAlign(0.5);
```

#### border.horizontal

Styles the horizontal (top and bottom) sides of `Border`.

```dart
border.horizontal.color.red();
border.horizontal.width(2);
border.horizontal.style.solid();
border.horizontal.strokeAlign(0.5);
```

#### border.vertical

Styles the vertical (left and right) sides of `Border`.

```dart
border.vertical.color.red();
border.vertical.width(2);
border.vertical.style.solid();
border.vertical.strokeAlign(0.5);
```

### borderDirectional

Defines the `BorderDirectional` of a Box. Equivalent to `BoxDecoration.border`, in a `Container`

#### call()

Styles all sides of `BorderDirectional`.

```dart
borderDirectional(
    color: Colors.red,
    width: 2,
    style: BorderStyle.solid,
    strokeAlign: 0.5
);
```

#### borderDirectional.all

Styles all sides of `BorderDirectional`.

```dart
borderDirectional.all.color.red();
borderDirectional.all.width(2);
borderDirectional.all.style.solid();
borderDirectional.all.strokeAlign(0.5);
```

#### borderDirectional.top

Styles the top side `BorderDirectional`.

```dart
borderDirectional.top.color.red();
borderDirectional.top.width(2);
borderDirectional.top.style.solid();
borderDirectional.top.strokeAlign(0.5);
```

#### borderDirectional.bottom

Styles the bottom side of `BorderDirectional`.

```dart
borderDirectional.bottom.color.red();
borderDirectional.bottom.width(2);
borderDirectional.bottom.style.solid();
borderDirectional.bottom.strokeAlign(0.5);
```

#### borderDirectional.start

Styles the start side of `BorderDirectional`.

```dart
borderDirectional.start.color.red();
borderDirectional.start.width(2);
borderDirectional.start.style.solid();
borderDirectional.start.strokeAlign(0.5);
```

#### borderDirectional.end

Styles the end side of `BorderDirectional`.

```dart
borderDirectional.end.color.red();
borderDirectional.end.width(2);
borderDirectional.end.style.solid();
borderDirectional.end.strokeAlign(0.5);
```

#### borderDirectional.horizontal

Styles the horizontal (start and end) sides of `BorderDirectional`.

```dart
borderDirectional.horizontal.color.red();
borderDirectional.horizontal.width(2);
borderDirectional.horizontal.style.solid();
borderDirectional.horizontal.strokeAlign(0.5);
```

#### borderDirectional.vertical

Styles the vertical (top and bottom) sides of `BorderDirectional`.

```dart
borderDirectional.vertical.color.red();
borderDirectional.vertical.width(2);
borderDirectional.vertical.style.solid();
borderDirectional.vertical.strokeAlign(0.5);
```

### borderRadius

Styles `Radius` the corners of a `BorderRadiusGeometry` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadius all: Radius.circular(10)
borderRadius(10);

// BorderRadius topLeft and topRight: Radius.circular(10), bottomLeft and bottomRight: Radius.circular(20)
borderRadius(10, 20);

// BorderRadius topLeft: Radius.circular(10), topRight and bottomLeft: Radius.circular(20), bottomRight: Radius.circular(30)
borderRadius(10, 20, 30);

// BorderRadius topLeft: Radius.circular(10), topRight: Radius.circular(20), bottomLeft: Radius.circular(30), bottomRight: Radius.circular(40)
borderRadius(10, 20, 30, 40);

/// BorderRadius all: Radius.circular(10)
borderRadius.circular(10);

/// BorderRadius all: Radius.elliptical(10, 20)
borderRadius.elliptical(10, 20);

/// BorderRadius all: Radius.zero
borderRadius.zero();
```

#### borderRadius.all

Styles a uniform `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
borderRadius.all(10);
borderRadius.all.circular(10);
borderRadius.all.elliptical(10, 20);
borderRadius.all.zero();
```

#### borderRadius.topLeft

Styles the topLeft `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
borderRadius.topLeft(10);
borderRadius.topLeft.circular(10);
borderRadius.topLeft.elliptical(10, 20);
borderRadius.topLeft.zero();
```

#### borderRadius.topRight

Styles the topRight `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
borderRadius.topRight(10);
borderRadius.topRight.circular(10);
borderRadius.topRight.elliptical(10, 20);
borderRadius.topRight.zero();
```

#### borderRadius.bottomLeft

Styles the bottomLeft `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
borderRadius.bottomLeft(10);
borderRadius.bottomLeft.circular(10);
borderRadius.bottomLeft.elliptical(10, 20);
borderRadius.bottomLeft.zero();
```

#### borderRadius.bottomRight

Styles the bottomRight `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
borderRadius.bottomRight(10);
borderRadius.bottomRight.circular(10);
borderRadius.bottomRight.elliptical(10, 20);
borderRadius.bottomRight.zero();
```

#### borderRadius.top

Styles the top (topLeft and topRight) `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
borderRadius.top(10);
borderRadius.top.circular(10);
borderRadius.top.elliptical(10, 20);
borderRadius.top.zero();
```

#### borderRadius.bottom

Styles the bottom (bottomLeft and bottomRight) `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
borderRadius.bottom(10);
borderRadius.bottom.circular(10);
borderRadius.bottom.elliptical(10, 20);
borderRadius.bottom.zero();
```

#### borderRadius.left

Styles the left (topLeft and bottomLeft) `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
border.left(10);
borderRadius.left.circular(10);
borderRadius.left.elliptical(10, 20);
borderRadius.left.zero();
```

#### borderRadius.right

Styles the right (topRight and bottomRight) `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
border.right(10);
borderRadius.right.circular(10);
borderRadius.right.elliptical(10, 20);
borderRadius.right.zero();
```

#### borderRadius.only

The same as calling `BorderRadius.only` of a `BoxDecoration.borderRadius`.

```dart
borderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(20),
    bottomLeft: Radius.circular(30),
    bottomRight: Radius.circular(40)
);
```

### borderRadiusDirectional

Styles the `BorderRadiusDirectional` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadiusDirectional.all(Radius.circular(10));
borderRadiusDirectional(10);

// BorderRadiusDirectional.only(topStart: Radius.circular(10), topEnd: Radius.circular(20), bottomStart: Radius.circular(10), bottomEnd: Radius.circular(20));
borderRadiusDirectional(10, 20);

// Applies 10 to topStart, 20 to topEnd and bottomStart, 30 to bottomEnd
// BorderRadiusDirectional.only(topStart: Radius.circular(10), topEnd: Radius.circular(20), bottomStart: Radius.circular(30), bottomEnd: Radius.circular(20));
borderRadiusDirectional(10, 20, 30);

// BorderRadiusDirectional.only(topStart: Radius.circular(10), topEnd: Radius.circular(20), bottomStart: Radius.circular(30), bottomEnd: Radius.circular(40));
borderRadiusDirectional(10, 20, 30, 40);

borderRadiusDirectional.circular(10);
borderRadiusDirectional.elliptical(10, 20);
borderRadiusDirectional.zero();
```

#### borderRadiusDirectional.all

Styles the `BorderRadiusDirectional.all` of a `BoxDecoration.borderRadius`.

```dart
borderRadiusDirectional.all(10);
borderRadiusDirectional.all.circular(10);
borderRadiusDirectional.all.elliptical(10, 20);
borderRadiusDirectional.all.zero();
```

#### borderRadiusDirectional.topStart

Styles the `BorderRadiusDirectional.topStart` of a `BoxDecoration.borderRadius`.

```dart
borderRadiusDirectional.topStart(10);
borderRadiusDirectional.topStart.circular(10);
borderRadiusDirectional.topStart.elliptical(10, 20);
borderRadiusDirectional.topStart.zero();
```

#### borderRadiusDirectional.topEnd

Styles the `BorderRadiusDirectional.topEnd` of a `BoxDecoration.borderRadius`.

```dart
borderRadiusDirectional.topEnd(10);
borderRadiusDirectional.topEnd.circular(10);
borderRadiusDirectional.topEnd.elliptical(10, 20);
borderRadiusDirectional.topEnd.zero();
```

#### borderRadiusDirectional.bottomStart

Styles the `BorderRadiusDirectional.bottomStart` of a `BoxDecoration.borderRadius`.

```dart
borderRadiusDirectional.bottomStart(10);
borderRadiusDirectional.bottomStart.circular(10);
borderRadiusDirectional.bottomStart.elliptical(10, 20);
borderRadiusDirectional.bottomStart.zero();
```

#### borderRadiusDirectional.bottomEnd

Styles the `BorderRadiusDirectional.bottomEnd` of a `BoxDecoration.borderRadius`.

```dart
borderRadiusDirectional.bottomEnd(10);
borderRadiusDirectional.bottomEnd.circular(10);
borderRadiusDirectional.bottomEnd.elliptical(10, 20);
borderRadiusDirectional.bottomEnd.zero();
```

#### borderRadiusDirectional.top

Styles the (topStart and topEnd) of a `BoxDecoration.borderRadius`.

```dart
borderRadiusDirectional.top(10);
borderRadiusDirectional.top.circular(10);
borderRadiusDirectional.top.elliptical(10, 20);
borderRadiusDirectional.top.zero();
```

#### borderRadiusDirectional.bottom

Styles the (bottomStart and bottomEnd) of a `BoxDecoration.borderRadius`.

```dart
borderRadiusDirectional.bottom(10);
borderRadiusDirectional.bottom.circular(10);
borderRadiusDirectional.bottom.elliptical(10, 20);
borderRadiusDirectional.bottom.zero();
```

#### borderRadiusDirectional.start

Styles (topStart and bottomStart) `BorderRadiusDirectional` of a `BoxDecoration.borderRadius`.

```dart
borderRadiusDirectional.start(10);
borderRadiusDirectional.start.circular(10);
borderRadiusDirectional.start.elliptical(10, 20);
borderRadiusDirectional.start.zero();
```

#### borderRadiusDirectional.end

Styles (topEnd and bottomEnd) `BorderRadiusDirectional` of a `BoxDecoration.borderRadius`.

```dart
borderRadiusDirectional.end(10);
borderRadiusDirectional.end.circular(10);
borderRadiusDirectional.end.elliptical(10, 20);
borderRadiusDirectional.end.zero();
```

#### borderRadiusDirectional.only

Similar to using `BorderRadiusDirectional.only` of a `BoxDecoration.borderRadius`.

```dart

borderRadiusDirectional.only(
    topStart: Radius.circular(10),
    topEnd: Radius.circular(20),
    bottomStart: Radius.circular(10),
    bottomEnd: Radius.circular(20)
);
```
