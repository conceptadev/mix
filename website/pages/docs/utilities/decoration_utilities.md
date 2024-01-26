## Decoration

### border

Defines the border of a Box. Equivalent to `BoxDecoration.border`, in a `Container`

```dart
border(
    color: Colors.red,
    width: 2,
    style: BorderStyle.solid,
    strokeAlign: 0.5
);
```

equivalent to

```dart
Border.all(
    color: Colors.red,
    width: 2,
    style: BorderStyle.solid,
    strokeAlign: 0.5
);
```

#### border.all

Sets a uniform border around the box.

```dart
border.all.color.red();
border.all.width(2);
border.all.style.solid();
border.all.strokeAlign(0.5);
```

equivalent to

```dart
Border.all(
    color: Colors.red,
    width: 2,
    style: BorderStyle.solid,
    strokeAlign: 0.5
);
```

#### border.top

Sets the top `Border` of a `BoxDecoration.border`.

```dart
border.top.color.red();
border.top.width(2);
border.top.style.solid();
border.top.strokeAlign(0.5);
```

equivalent to

```dart
Border(
    top: BorderSide(
        color: Colors.red,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
    ),
);
```

#### border.bottom

Sets the bottom `Border` of a `BoxDecoration.border`.

```dart
border.bottom.color.red();
border.bottom.width(2);
border.bottom.style.solid();
border.bottom.strokeAlign(0.5);
```

equivalent to

```dart
Border(
    bottom: BorderSide(
        color: Colors.red,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
    ),
);
```

#### border.left

Sets the left `Border` of a `BoxDecoration.border`.

```dart
border.left.color.red();
border.left.width(2);
border.left.style.solid();
border.left.strokeAlign(0.5);
```

equivalent to

```dart
Border(
    left: BorderSide(
        color: Colors.red,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
    ),
);
```

#### border.right

Sets the right `Border` of a `BoxDecoration.border`.

```dart

border.right.color.red();
border.right.width(2);
border.right.style.solid();
border.right.strokeAlign(0.5);
```

equivalent to

```dart
Border(
    right: BorderSide(
        color: Colors.red,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
    ),
);
```

#### border.horizontal

Sets the horizontal (top and bottom) `Border` of a `BoxDecoration.border`.

```dart
border.horizontal.color.red();
border.horizontal.width(2);
border.horizontal.style.solid();
border.horizontal.strokeAlign(0.5);
```

equivalent to

```dart
Border.symmetric(
    horizontal: BorderSide(
        color: Colors.red,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
    ),
);
```

#### border.vertical

Sets the vertical (left and right) `Border` of a `BoxDecoration.border`.

```dart
border.vertical.color.red();
border.vertical.width(2);
border.vertical.style.solid();
border.vertical.strokeAlign(0.5);
```

equivalent to

```dart
Border.symmetric(
    vertical: BorderSide(
        color: Colors.red,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
    ),
);
```

### borderDirectional

Defines the `BorderDirectional` of a Box. Equivalent to `BoxDecoration.border`, in a `Container`

```dart
borderDirectional(
    color: Colors.red,
    width: 2,
    style: BorderStyle.solid,
    strokeAlign: 0.5
);
```

equivalent to

```dart
BorderDirectional.all(
    color: Colors.red,
    width: 2,
    style: BorderStyle.solid,
    strokeAlign: 0.5
);
```

#### borderDirectional.all

Sets a uniform `BorderDirectional` around the box.

```dart
borderDirectional.all.color.red();
borderDirectional.all.width(2);
borderDirectional.all.style.solid();
borderDirectional.all.strokeAlign(0.5);
```

equivalent to

```dart
BorderDirectional.all(
    color: Colors.red,
    width: 2,
    style: BorderStyle.solid,
    strokeAlign: 0.5
);
```

#### borderDirectional.top

Sets the top `BorderDirectional` of a `BoxDecoration.border`.

```dart
borderDirectional.top.color.red();
borderDirectional.top.width(2);
borderDirectional.top.style.solid();
borderDirectional.top.strokeAlign(0.5);
```

equivalent to

```dart
BorderDirectional(
    top: BorderSide(
        color: Colors.red,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
    ),
);
```

#### borderDirectional.bottom

Sets the bottom `BorderDirectional` of a `BoxDecoration.border`.

```dart
borderDirectional.bottom.color.red();
borderDirectional.bottom.width(2);
borderDirectional.bottom.style.solid();
borderDirectional.bottom.strokeAlign(0.5);
```

equivalent to

```dart
BorderDirectional(
    bottom: BorderSide(
        color: Colors.red,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
    ),
);
```

#### borderDirectional.start

Sets the start `BorderDirectional` of a `BoxDecoration.border`.

```dart
borderDirectional.start.color.red();
borderDirectional.start.width(2);
borderDirectional.start.style.solid();
borderDirectional.start.strokeAlign(0.5);
```

equivalent to

```dart
BorderDirectional(
    start: BorderSide(
        color: Colors.red,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
    ),
);
```

#### borderDirectional.end

Sets the end `BorderDirectional` of a `BoxDecoration.border`.

```dart
borderDirectional.end.color.red();
borderDirectional.end.width(2);
borderDirectional.end.style.solid();
borderDirectional.end.strokeAlign(0.5);
```

equivalent to

```dart
BorderDirectional(
    end: BorderSide(
        color: Colors.red,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
    ),
);
```

#### borderDirectional.horizontal

Sets the horizontal (start and end) `BorderDirectional` of a `BoxDecoration.border`.

```dart
borderDirectional.horizontal.color.red();
borderDirectional.horizontal.width(2);
borderDirectional.horizontal.style.solid();
borderDirectional.horizontal.strokeAlign(0.5);
```

equivalent to

```dart
BorderDirectional.symmetric(
    horizontal: BorderSide(
        color: Colors.red,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
    ),
);
```

#### borderDirectional.vertical

Sets the vertical (top and bottom) `BorderDirectional` of a `BoxDecoration.border`.

```dart
borderDirectional.vertical.color.red();
borderDirectional.vertical.width(2);
borderDirectional.vertical.style.solid();
borderDirectional.vertical.strokeAlign(0.5);
```

equivalent to

```dart
BorderDirectional.symmetric(
    vertical: BorderSide(
        color: Colors.red,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
    ),
);
```

### borderRadius

Sets `Radius` the corners of a `BorderRadiusGeometry` of a `BoxDecoration.borderRadius`.

```dart
borderRadius(10);
```

equivalent to

```dart
BorderRadius.all(Radius.circular(10));
```

```dart
borderRadius(10, 20);
```

equivalent to

```dart
BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(20),
);
```

```dart
borderRadius(10, 20, 30);
```

equivalent to

```dart
BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(20),
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(30),
);
```

```dart
borderRadius(10, 20, 30, 40);
```

equivalent to

```dart
BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(20),
    bottomLeft: Radius.circular(30),
    bottomRight: Radius.circular(40),
);
```

```dart
borderRadius.circular(10);
```

equivalent to

```dart
BorderRadius.circular(10);
```

```dart
borderRadius.elliptical(10, 20);
```

equivalent to

```dart
BorderRadius.elliptical(10, 20);
```

```dart
borderRadius.zero();
```

equivalent to

```dart
BorderRadius.zero;
```

#### borderRadius.all

Sets a uniform `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadius.all(Radius.circular(10));
borderRadius.all(10);

// BorderRadius.circular(10);
borderRadius.all.circular(10);

// BorderRadius.elliptical(10, 20);
borderRadius.all.elliptical(10, 20);

// BorderRadius.zero
borderRadius.all.zero();
```

#### borderRadius.topLeft

Sets the topLeft `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadius.only(topLeft: Radius.circular(10));
borderRadius.topLeft(10);

// BorderRadius.only(topLeft: Radius.circular(10));
borderRadius.topLeft.circular(10);

// BorderRadius.only(topLeft: Radius.elliptical(10, 20));
borderRadius.topLeft.elliptical(10, 20);

// BorderRadius.only(topLeft: Radius.zero);
borderRadius.topLeft.zero();
```

#### borderRadius.topRight

Sets the topRight `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadius.only(topRight: Radius.circular(10));
borderRadius.topRight(10);

// BorderRadius.only(topRight: Radius.circular(10));
borderRadius.topRight.circular(10);

// BorderRadius.only(topRight: Radius.elliptical(10, 20));
borderRadius.topRight.elliptical(10, 20);

// BorderRadius.only(topRight: Radius.zero);
borderRadius.topRight.zero();
```

#### borderRadius.bottomLeft

Sets the bottomLeft `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadius.only(bottomLeft: Radius.circular(10));
borderRadius.bottomLeft(10);

// BorderRadius.only(bottomLeft: Radius.circular(10));
borderRadius.bottomLeft.circular(10);

// BorderRadius.only(bottomLeft: Radius.elliptical(10, 20));
borderRadius.bottomLeft.elliptical(10, 20);

// BorderRadius.only(bottomLeft: Radius.zero);
borderRadius.bottomLeft.zero();
```

#### borderRadius.bottomRight

Sets the bottomRight `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadius.only(bottomRight: Radius.circular(10));
borderRadius.bottomRight(10);

// BorderRadius.only(bottomRight: Radius.circular(10));
borderRadius.bottomRight.circular(10);

// BorderRadius.only(bottomRight: Radius.elliptical(10, 20));
borderRadius.bottomRight.elliptical(10, 20);

// BorderRadius.only(bottomRight: Radius.zero);
borderRadius.bottomRight.zero();
```

#### borderRadius.top

Sets the top (topLeft and topRight) `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10));
borderRadius.top(10);

// BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10));
borderRadius.top.circular(10);

// BorderRadius.only(topLeft: Radius.elliptical(10, 20), topRight: Radius.elliptical(10, 20));
borderRadius.top.elliptical(10, 20);

// BorderRadius.only(topLeft: Radius.zero, topRight: Radius.zero);
borderRadius.top.zero();
```

#### borderRadius.bottom

Sets the bottom (bottomLeft and bottomRight) `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10));
borderRadius.bottom(10);

// BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10));
borderRadius.bottom.circular(10);

// BorderRadius.only(bottomLeft: Radius.elliptical(10, 20), bottomRight: Radius.elliptical(10, 20));
borderRadius.bottom.elliptical(10, 20);

// BorderRadius.only(bottomLeft: Radius.zero, bottomRight: Radius.zero);
borderRadius.bottom.zero();
```

#### borderRadius.left

Sets the left (topLeft and bottomLeft) `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10));
border.left(10);

// BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10));
borderRadius.left.circular(10);

// BorderRadius.only(topLeft: Radius.elliptical(10, 20), bottomLeft: Radius.elliptical(10, 20));
borderRadius.left.elliptical(10, 20);

// BorderRadius.only(topLeft: Radius.zero, bottomLeft: Radius.zero);
borderRadius.left.zero();
```

#### borderRadius.right

Sets the right (topRight and bottomRight) `BorderRadius` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10));
border.right(10);

// BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10));
borderRadius.right.circular(10);

// BorderRadius.only(topRight: Radius.elliptical(10, 20), bottomRight: Radius.elliptical(10, 20));
borderRadius.right.elliptical(10, 20);

// BorderRadius.only(topRight: Radius.zero, bottomRight: Radius.zero);
borderRadius.right.zero();
```

#### borderRadius.only

Sets the `BorderRadius.only` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(20), bottomLeft: Radius.circular(30), bottomRight: Radius.circular(40));
borderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(20),
    bottomLeft: Radius.circular(30),
    bottomRight: Radius.circular(40)
);
```

### borderRadiusDirectional

Sets the `BorderRadiusDirectional` of a `BoxDecoration.borderRadius`.

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

// BorderRadiusDirectional.circular(10);
borderRadiusDirectional.circular(10);

// BorderRadiusDirectional.elliptical(10, 20);
borderRadiusDirectional.elliptical(10, 20);

// BorderRadiusDirectional.zero
borderRadiusDirectional.zero();
```

#### borderRadiusDirectional.all

Sets the `BorderRadiusDirectional.all` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadiusDirectional.all(Radius.circular(10));
borderRadiusDirectional.all(10);

// BorderRadiusDirectional.circular(10);
borderRadiusDirectional.all.circular(10);

// BorderRadiusDirectional.elliptical(10, 20);
borderRadiusDirectional.all.elliptical(10, 20);

// BorderRadiusDirectional.zero
borderRadiusDirectional.all.zero();
```

#### borderRadiusDirectional.topStart

Sets the `BorderRadiusDirectional.topStart` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadiusDirectional.only(topStart: Radius.circular(10));
borderRadiusDirectional.topStart(10);

// BorderRadiusDirectional.only(topStart: Radius.circular(10));
borderRadiusDirectional.topStart.circular(10);

// BorderRadiusDirectional.only(topStart: Radius.elliptical(10, 20));
borderRadiusDirectional.topStart.elliptical(10, 20);

// BorderRadiusDirectional.only(topStart: Radius.zero);
borderRadiusDirectional.topStart.zero();
```

#### borderRadiusDirectional.topEnd

Sets the `BorderRadiusDirectional.topEnd` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadiusDirectional.only(topEnd: Radius.circular(10));
borderRadiusDirectional.topEnd(10);

// BorderRadiusDirectional.only(topEnd: Radius.circular(10));
borderRadiusDirectional.topEnd.circular(10);

// BorderRadiusDirectional.only(topEnd: Radius.elliptical(10, 20));
borderRadiusDirectional.topEnd.elliptical(10, 20);

// BorderRadiusDirectional.only(topEnd: Radius.zero);
borderRadiusDirectional.topEnd.zero();
```

#### borderRadiusDirectional.bottomStart

Sets the `BorderRadiusDirectional.bottomStart` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadiusDirectional.only(bottomStart: Radius.circular(10));
borderRadiusDirectional.bottomStart(10);

// BorderRadiusDirectional.only(bottomStart: Radius.circular(10));
borderRadiusDirectional.bottomStart.circular(10);

// BorderRadiusDirectional.only(bottomStart: Radius.elliptical(10, 20));
borderRadiusDirectional.bottomStart.elliptical(10, 20);

// BorderRadiusDirectional.only(bottomStart: Radius.zero);
borderRadiusDirectional.bottomStart.zero();
```

#### borderRadiusDirectional.bottomEnd

Sets the `BorderRadiusDirectional.bottomEnd` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadiusDirectional.only(bottomEnd: Radius.circular(10));
borderRadiusDirectional.bottomEnd(10);

// BorderRadiusDirectional.only(bottomEnd: Radius.circular(10));
borderRadiusDirectional.bottomEnd.circular(10);

// BorderRadiusDirectional.only(bottomEnd: Radius.elliptical(10, 20));
borderRadiusDirectional.bottomEnd.elliptical(10, 20);

// BorderRadiusDirectional.only(bottomEnd: Radius.zero);
borderRadiusDirectional.bottomEnd.zero();
```

#### borderRadiusDirectional.top

Sets the `BorderRadiusDirectional.top` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadiusDirectional.only(topStart: Radius.circular(10), topEnd: Radius.circular(10));
borderRadiusDirectional.top(10);

// BorderRadiusDirectional.only(topStart: Radius.circular(10), topEnd: Radius.circular(10));
borderRadiusDirectional.top.circular(10);

// BorderRadiusDirectional.only(topStart: Radius.elliptical(10, 20), topEnd: Radius.elliptical(10, 20));
borderRadiusDirectional.top.elliptical(10, 20);

// BorderRadiusDirectional.only(topStart: Radius.zero, topEnd: Radius.zero);
borderRadiusDirectional.top.zero();
```

#### borderRadiusDirectional.bottom

Sets the `BorderRadiusDirectional.bottom` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadiusDirectional.only(bottomStart: Radius.circular(10), bottomEnd: Radius.circular(10));
borderRadiusDirectional.bottom(10);

// BorderRadiusDirectional.only(bottomStart: Radius.circular(10), bottomEnd: Radius.circular(10));
borderRadiusDirectional.bottom.circular(10);

// BorderRadiusDirectional.only(bottomStart: Radius.elliptical(10, 20), bottomEnd: Radius.elliptical(10, 20));
borderRadiusDirectional.bottom.elliptical(10, 20);

// BorderRadiusDirectional.only(bottomStart: Radius.zero, bottomEnd: Radius.zero);
borderRadiusDirectional.bottom.zero();
```

#### borderRadiusDirectional.start

Sets (topStart and bottomStart) `BorderRadiusDirectional` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadiusDirectional.only(topStart: Radius.circular(10), bottomStart: Radius.circular(10));
borderRadiusDirectional.start(10);

// BorderRadiusDirectional.only(topStart: Radius.circular(10), bottomStart: Radius.circular(10));
borderRadiusDirectional.start.circular(10);

// BorderRadiusDirectional.only(topStart: Radius.elliptical(10, 20), bottomStart: Radius.elliptical(10, 20));

borderRadiusDirectional.start.elliptical(10, 20);

// BorderRadiusDirectional.only(topStart: Radius.zero, bottomStart: Radius.zero);
borderRadiusDirectional.start.zero();
```

#### borderRadiusDirectional.end

Sets (topEnd and bottomEnd) `BorderRadiusDirectional` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadiusDirectional.only(topEnd: Radius.circular(10), bottomEnd: Radius.circular(10));
borderRadiusDirectional.end(10);

// BorderRadiusDirectional.only(topEnd: Radius.circular(10), bottomEnd: Radius.circular(10));
borderRadiusDirectional.end.circular(10);

// BorderRadiusDirectional.only(topEnd: Radius.elliptical(10, 20), bottomEnd: Radius.elliptical(10, 20));
borderRadiusDirectional.end.elliptical(10, 20);

// BorderRadiusDirectional.only(topEnd: Radius.zero, bottomEnd: Radius.zero);
borderRadiusDirectional.end.zero();
```

#### borderRadiusDirectional.only

Equivalent to `BorderRadiusDirectional.only` of a `BoxDecoration.borderRadius`.

```dart
// BorderRadiusDirectional.only(topStart: Radius.circular(10), topEnd: Radius.circular(20), bottomStart: Radius.circular(10), bottomEnd: Radius.circular(20));
borderRadiusDirectional.only(
    topStart: Radius.circular(10),
    topEnd: Radius.circular(20),
    bottomStart: Radius.circular(10),
    bottomEnd: Radius.circular(20)
);
```
