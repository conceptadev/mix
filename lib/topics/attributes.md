The _Attributes_ system in _Mix_ consists of three types of objects:
- _Attributes_ (these classes) &mdash; the classes that actually are instantiated in the _Mix_ object.
- [_Utilities_](./Utilities-topic.html) &mdash; These classes provide static functions that can instantiate their corresponding _Attribute_ classes.
- _Short Utils_ &mdash; One line abbreviated functions that invoke the corresponding _Utility_ class to instantiate the corresponding _Attribute_ class. See the [_Utilities_](./Utilities-topic.html) topic page for more information.

This may seem like a lot of parts to create _Attributes_, but under normal usage, you won't deal with any of the _Attribute_ or _Utility_ classes, directly.  Rather, you will instantiate them using the _Short Utils_ utility functions, which are listed in their corresponding _Utility_ functions.

_Attribute_ classes are listed here for completeness.