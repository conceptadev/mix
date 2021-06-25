// import '../attributes/base_attribute.dart';
// import '../utils.dart';

// typedef Mix = BaseMix<Attribute>;
// typedef MixBox = BaseMix<BoxTypeAttribute>;
// typedef MixFlex = BaseMix<FlexTypeAttribute>;
// typedef MixText = BaseMix<TextTypeAttribute>;

// /// Defines a mix
// class BaseMix<T extends Attribute> {
//   const BaseMix._(this.params);

//   final List<T> params;

//   /// Define mix with parameters
//   factory BaseMix([
//     T? p1,
//     T? p2,
//     T? p3,
//     T? p4,
//     T? p5,
//     T? p6,
//     T? p7,
//     T? p8,
//     T? p9,
//     T? p10,
//     T? p11,
//     T? p12,
//   ]) {
//     final params = attributeParamToList<T>(
//       p1,
//       p2,
//       p3,
//       p4,
//       p5,
//       p6,
//       p7,
//       p8,
//       p9,
//       p10,
//       p11,
//       p12,
//     );
//     return BaseMix._(params);
//   }

//   /// Merges 2 or 3 shape definitions
//   factory BaseMix.combine([
//     BaseMix<T>? mix1,
//     BaseMix<T>? mix2,
//     BaseMix<T>? mix3,
//     BaseMix<T>? mix4,
//     BaseMix<T>? mix5,
//   ]) {
//     final list = <T>[];
//     if (mix1 != null) list.addAll(mix1.params);
//     if (mix2 != null) list.addAll(mix2.params);
//     if (mix3 != null) list.addAll(mix3.params);
//     if (mix4 != null) list.addAll(mix4.params);
//     if (mix5 != null) list.addAll(mix5.params);

//     return BaseMix._(list);
//   }

//   /// Chooses mix based on condition
//   factory BaseMix.chooser({
//     required bool condition,
//     required BaseMix<T> trueMix,
//     required BaseMix<T> falseMix,
//   }) {
//     if (condition) {
//       return trueMix;
//     } else {
//       return falseMix;
//     }
//   }

//   BaseMix mix([
//     T? p1,
//     T? p2,
//     T? p3,
//     T? p4,
//     T? p5,
//     T? p6,
//     T? p7,
//     T? p8,
//     T? p9,
//     T? p10,
//     T? p11,
//     T? p12,
//   ]) {
//     final newParams = [...params];
//     newParams.addAll(
//       attributeParamToList<T>(
//           p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12),
//     );

//     return BaseMix._(newParams);
//   }
// }
