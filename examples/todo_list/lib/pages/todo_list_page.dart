import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:todo_list/pages/add_task_page.dart';
import 'package:todo_list/pages/controller/task_controller.dart';
import 'package:todo_list/style/components/icon_button.dart';
import 'package:todo_list/style/components/list_tile.dart';
import 'package:todo_list/style/design_tokens.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TasksController _controller = TasksController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: $token.color.surface.resolve(context),
      appBar: AppBar(
        backgroundColor: $token.color.surface.resolve(context),
        title: StyledText(
          'To Do List',
          style: Style(
            $text.style.ref($token.textStyle.heading2),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: _controller,
        builder: (context, value, child) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: value.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Text(
                  'Today',
                  style: $token.textStyle.heading1.resolve(context),
                );
              }
              final item = value[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TodoCheckboxListTile(
                  checked: item.value,
                  onChanged: (e) => setState(() {
                    _controller.updateTask(index - 1, e);
                  }),
                  text: item.text,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: TodoIconButton(
        icon: Icons.edit_rounded,
        onPressed: () {
          Future.delayed(
            const Duration(milliseconds: 200),
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTaskPage(
                  controller: _controller,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
