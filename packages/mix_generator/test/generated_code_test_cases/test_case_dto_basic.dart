// part of 'source_gen_entrypoint.dart';

// @ShouldGenerate(r'''
// abstract class _$BasicClassCWProxy<T extends Iterable<int>> {
//   BasicClass<T> id(String id);

//   BasicClass<T> optional(T? optional);

//   /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BasicClass<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
//   ///
//   /// Usage
//   /// ```dart
//   /// BasicClass<T>(...).copyWith(id: 12, name: "My name")
//   /// ````
//   BasicClass<T> call({
//     String? id,
//     T? optional,
//   });
// }

// /// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBasicClass.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBasicClass.copyWith.fieldName(...)`
// class _$BasicClassCWProxyImpl<T extends Iterable<int>>
//     implements _$BasicClassCWProxy<T> {
//   const _$BasicClassCWProxyImpl(this._value);

//   final BasicClass<T> _value;

//   @override
//   BasicClass<T> id(String id) => this(id: id);

//   @override
//   BasicClass<T> optional(T? optional) => this(optional: optional);

//   @override

//   /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BasicClass<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
//   ///
//   /// Usage
//   /// ```dart
//   /// BasicClass<T>(...).copyWith(id: 12, name: "My name")
//   /// ````
//   BasicClass<T> call({
//     Object? id = const $CopyWithPlaceholder(),
//     Object? optional = const $CopyWithPlaceholder(),
//   }) {
//     return BasicClass<T>(
//       id: id == const $CopyWithPlaceholder() || id == null
//           ? _value.id
//           // ignore: cast_nullable_to_non_nullable
//           : id as String,
//       optional: optional == const $CopyWithPlaceholder()
//           ? _value.optional
//           // ignore: cast_nullable_to_non_nullable
//           : optional as T?,
//       immutable: _value.immutable,
//       nullableImmutable: _value.nullableImmutable,
//     );
//   }
// }

// extension $BasicClassCopyWith<T extends Iterable<int>> on BasicClass<T> {
//   /// Returns a callable class that can be used as follows: `instanceOfBasicClass.copyWith(...)` or like so:`instanceOfBasicClass.copyWith.fieldName(...)`.
//   // ignore: library_private_types_in_public_api
//   _$BasicClassCWProxy<T> get copyWith => _$BasicClassCWProxyImpl<T>(this);
// }
// ''')
// @MixableDto()
// class BasicDtoClass extends Dto<BasicDtoClass> {
//   const BasicDtoClass({
//     this.nullableString,
//     this.nullableBool,
//     this.nullableInt,
//     this.nullableDouble,
//   });

//   final String? nullableString;
//   final bool? nullableBool;

//   final int? nullableInt;
//   final double? nullableDouble;
// }
