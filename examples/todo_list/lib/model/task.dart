class Task {
  final String text;
  final bool value;

  Task({
    required this.text,
    required this.value,
  });

  Task copyWith({
    String? text,
    bool? value,
  }) {
    return Task(
      text: text ?? this.text,
      value: value ?? this.value,
    );
  }
}
