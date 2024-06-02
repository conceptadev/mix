// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// SpecDefinitionGenerator
// **************************************************************************

class Person {
  const Person(
    this.name,
    this.age,
  );

  final String? name;

  final int age;

  Person copyWith({
    String? name,
    int age,
  }) {
    return Person(name: name ?? this.name, age: age ?? this.age);
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'age': age};
  }

  @override
  String toString() {
    return 'Person(name: $name, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Person && other.name == name && other.age == age;
  }

  @override
  int get hashCode {
    return name.hashCode ^ age.hashCode;
  }
}
