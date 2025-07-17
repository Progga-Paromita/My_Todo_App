import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/Widget/variables.dart';
import '../bloc/todo_bloc/todo_bloc.dart';
import 'custom_border.dart';

class EditIconButton extends StatelessWidget {

  final int index;
  final VoidCallback onPressed;
  TextEditingController titleController = Variables.titleController;
  final border = CustomBorder.border;

  EditIconButton({super.key, required this.index, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context);
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Edit Title"),
              content: Text('You can edit title of the current index.'),
              actions: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hint: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 5),
                        Text('Edit Title', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  onSubmitted: (titlename) =>onPressed(),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 145),
                    ElevatedButton(
                      onPressed: () {
                        titleController.clear();
                        Navigator.pop(context);
                      },
                      child: Text('Back'),
                    ),
                    SizedBox(width: 6),
                    ElevatedButton(
                      onPressed: () =>onPressed(),
                      child: Text("Done"),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
      icon: Icon(Icons.edit, size: 28),
    );
    ;
  }
}
