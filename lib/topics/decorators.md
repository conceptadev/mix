_Decorators_ are special _Attributes_ &mdash; 
they are unique in that they don't actually set a property
on the widget itself, but on a parent widget.

For instance, it is not possible to set a property like 'scale'
on a widget &mdash; you have to set scale on a _Material_ parent
instance to achieve it.

_Decorators_ allow you to treat these kinds of properties as if
they were on the widget itself: _Mix_ takes care of parenting
the target widget with an appropriate widget, and setting the
corresponding property on that widget.

_Decorators_ are added to the _Mix_ object like any other _Attribute_.

Also, as with any other _Attribute_, there is a _Utility_ class to
create them, and associated _Short Utils_.
