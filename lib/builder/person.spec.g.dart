import 'package:your_package/person.dart';

part of 'person.dart';

// **************************************************************************
// SpecDefinitionGenerator
// **************************************************************************

import 'package:flutter/foundation.dart';

      class PersonDefSpec extends Spec<PersonDefSpec> {const PersonDefSpec({required this.name, required this.age, required this.address, required this.isEmployed, required this.height, required this.hobbies, required this.favoriteColors, });

final String? name;

final int age;

final Map<String, String> address;

final bool isEmployed;

final double height;

final Set<String> hobbies;

final List<String> favoriteColors;

PersonDefSpec copyWith({String? name, int? age, Map<String, String>? address, bool? isEmployed, double? height, Set<String>? hobbies, List<String>? favoriteColors, }) {           return PersonDefSpec(
            name: name ?? this.name, age: age ?? this.age, address: address ?? this.address, isEmployed: isEmployed ?? this.isEmployed, height: height ?? this.height, hobbies: hobbies ?? this.hobbies, favoriteColors: favoriteColors ?? this.favoriteColors
          );
         } 
@override String toString() {           return 'PersonDefSpec(name: $name, age: $age, address: $address, isEmployed: $isEmployed, height: $height, hobbies: $hobbies, favoriteColors: $favoriteColors)';
         } 
@override bool operator ==(Object other) {           if (identical(this, other)) return true;

          return other is PersonDefSpec && other.name == name && other.age == age && mapEquals(other.address, address) && other.isEmployed == isEmployed && other.height == height && setEquals(other.hobbies, hobbies) && listEquals(other.favoriteColors, favoriteColors);
         } 
@override int get hashCode {           return name.hashCode ^ age.hashCode ^ address.hashCode ^ isEmployed.hashCode ^ height.hashCode ^ hobbies.hashCode ^ favoriteColors.hashCode;
         } 
@override PersonDefSpec lerp(PersonDefSpec? other, double t, ) {           if (other == null) return this;

          return PersonDefSpec(
            name: other.name, age: lerpInt(this.age, other.age, t), address: other.address, isEmployed: lerpSnap(this.isEmployed, other.isEmployed, t), height: lerpDouble(this.height, other.height, t), hobbies: other.hobbies, favoriteColors: other.favoriteColors
          );
         } 
 }
