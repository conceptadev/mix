_Variants_ are special _Attributes_ &mdash; they can be thought of as 
_actionable attributes_ in a _Mix_

They are triggered when a specific UI state changes (such as `hover`).

When the _Variant_ is triggered, the attributes listed under that _Variant_
description take effect. Those attributes will override (if they are
already present) or add to (if they are not) the current list of
attributes.

_Variants_ are added to the _Mix_ object like any other _Attribute_.

Also, as with any other _Attribute_, there is a _Utility_ class to
create them, and associated _Short Utils_.

There are several built-in system _Variants_.
See the [_VariantUtils_ class](VariantUtils-class.html)
for a list of the utilities you can use to specify these.
