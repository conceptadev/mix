import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';

class TasksController extends ValueNotifier<List<Task>> {
  TasksController()
      : super([
          Task(text: 'Use Mix in an awesome project', value: false),
        ]);

  void addTask(Task task) {
    value.add(task);
    notifyListeners();
  }

  void updateTask(int index, bool checked) {
    value[index] = value[index].copyWith(
      value: checked,
    );
  }
}
