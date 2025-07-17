import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc/todo_bloc.dart';

class MyDrawer extends StatelessWidget {
   MyDrawer({super.key});

  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: ClipRRect()),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Dark",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  trailing: BlocBuilder<TodoBloc, TodoState>(
                    bloc: todoBloc,
                    builder: (context, state) {
                      return Switch(
                        value: !state.isDark,
                        onChanged: (newValue) {
                          context.read<TodoBloc>().add(
                            AppMood(isDark: newValue),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "settings",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.settings, size: 33),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}


// SizedBox(height: 10),
// BlocBuilder<TodoBloc, TodoState>(
// bloc: todoBloc,
// builder: (context, state) {
// return ListTile(
// onTap: () {
// showDialog(
// context: context,
// builder: (context) => ShowDialogbox(
// title: "Add title",
// content: "You can add a title here.",
// action1: Text(""),
// action2: Text("Dene"),
// hintText: '+ Add Item',
// onPressed: () {
// String titleName = titleController.text
//     .toString();
// context.read<TodoBloc>().add(
// AddTodo_All(name: titleName),
// );
// Navigator.of(context).pop();
// },
// ),
// );
// },
// title: Text(
// "Add Item",
// style: TextStyle(
// fontSize: 30,
// fontWeight: FontWeight.bold,
// ),
// ),
// trailing: Icon(CupertinoIcons.plus, size: 33),
// );
// },
// ),
// SizedBox(height: 10),
// ListTile(
// onTap: () {
// showDialog(
// context: context,
// builder: (context) => ShowDialogbox(
// title: 'Delete',
// content: "Delete the last item.",
// isDelete: true,
// action1: Icon(Icons.delete),
// action2: Text("Back"), onPressed: () {
// String titleName = titleController.text.toString();
// context.read<TodoBloc>().add(AddTodo_All(name: titleName));
// Navigator.of(context).pop();
// },
// ),
// );
// },
// title: Text(
// "Delete Item",
// style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
// ),
// trailing: Icon(CupertinoIcons.delete, size: 33),
// ),