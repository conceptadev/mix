import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:todo_list/pages/controller/task_controller.dart';
import 'package:todo_list/style/components/list_tile.dart';
import 'package:todo_list/style/design_tokens.dart';

const _colors = ColorTokens();
const _textStyles = TextStyleTokens();

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
      backgroundColor: _colors.surface.resolve(context),
      appBar: AppBar(
        backgroundColor: _colors.surface.resolve(context),
        title: StyledText(
          'To Do List',
          style: Style(
            $text.style.ref(_textStyles.heading2),
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
                  style: _textStyles.heading1.resolve(context),
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
      // floatingActionButton: TodoIconButton(
      //   icon: Icons.edit_rounded,
      //   onPressed: () {
      //     final currentContext = context;
      //     Future.delayed(
      //       const Duration(milliseconds: 200),
      //       () {
      //         if (!mounted) return;
      //         Navigator.push(
      //           currentContext,
      //           MaterialPageRoute(
      //             builder: (context) => AddTaskPage(
      //               controller: _controller,
      //             ),
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
