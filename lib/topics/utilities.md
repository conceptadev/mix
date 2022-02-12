_Utilities_ are classes with static functions and a series of global constants and functions for a given widget type that can be used to instantiate _Attribute_ objects.

To use a utility class &mdash; say a _BoxUtility_ class to create _Attributes_ for, say, _backgroundColor_ and _height_, you could use the following code:

```dart
  Mix newMix = Mix(
    BoxUtility.backgroundColor(Colors.green),
    BoxUtility.height(20.0)
    );
```

## Short Utils
The above works fine, but it's somewhat onerous to have to specify the utility class and full attribute name for every attribute you want to define.

Instead, _Mix_ defines a set of global shortcut functions that you can use, instead:

```dart
  Mix newMix = Mix(
    bgColor(Colors.green),
    h(20.0)
  );
```

Global functions are defined for each utility function, and will return an attribute of the correct type by virtue of the fact that utility shortcut names are unique.

## Under The Covers

What is happening in the above code snippet can be traced in the source.  _BoxUtility_ shortcuts are defined in the file '.../attributes/box/box_short.utils.  The ones we are using are declared thus:

```dart
  const bgColor = BoxUtility.backgroundColor;
  const h = BoxUtility.height;
```

These constants are assigned to the following static functions in BoxUtility.dart:

```dart
    static BoxAttributes backgroundColor(Color color) =>
      BoxAttributes(color: color);

    static BoxAttributes height(double height) {
      return BoxAttributes(height: height);
    }
```

Note that each of these functions returns a _BoxAttributes_ class, which is derived from _Attributes_.

