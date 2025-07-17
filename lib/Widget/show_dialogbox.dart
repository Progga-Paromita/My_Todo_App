import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/Widget/custom_border.dart';
import '../bloc/todo_bloc/todo_bloc.dart';

class ShowDialogbox extends StatelessWidget {
  final String title;
  final String content;
  final String hintText;
  final bool isDelete;
  final Widget action1;
  final Widget action2;
  final VoidCallback onPressed;


  ShowDialogbox({
    super.key,
    required this.title,
    required this.content,
    this.isDelete = false,
    required this.action1,
    required this.action2,
    this.hintText='',
    required this.onPressed,
  });

  TextEditingController titleController = TextEditingController();
  final border = CustomBorder.border;

  @override
  Widget build(BuildContext context) {
    if (!isDelete) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hint: Text(hintText, style: TextStyle(fontSize: 20)),
              focusedBorder: border,
              enabledBorder: border,
            ),
            onSubmitted: (titlename) =>onPressed,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () =>onPressed,
            child: action2,
          ),
        ],
      );
    } else {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          ElevatedButton(
            onPressed: () {
              context.read<TodoBloc>().add(
                DeleteTodo_All(
                  deletedIndex:
                      context.read<TodoBloc>().state.todoList_All!.length - 1,
                ),
              );
              Navigator.of(context).pop();
            },
            child: action1,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: action2,
          ),
        ],
      );
    }
  }
}
