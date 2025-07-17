import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Widget/cusom_textfield.dart';
import '../Widget/edit_icon_button.dart';
import '../Widget/shared_pref_helper.dart';
import '../Widget/variables.dart';
import '../bloc/todo_bloc/todo_bloc.dart';

class PersonalTodoTitleScreen extends StatefulWidget {
  PersonalTodoTitleScreen({super.key});

  @override
  State<PersonalTodoTitleScreen> createState() => _PersonalTodoTitleScreenState();
}

class _PersonalTodoTitleScreenState extends State<PersonalTodoTitleScreen> {
  final titleController = Variables.titleController;

  List<String> todoListPersonal = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  void _loadTodos() async {
    final todos = await SharedPrefHelper.loadTodoListAll(true);
    setState(() {
      todoListPersonal = todos;
    });
  }

  void _addTodo(String newTodo) async {
    if (newTodo.isEmpty) return;
    setState(() {
      todoListPersonal.add(newTodo);
    });
    await SharedPrefHelper.saveTodoListAll(todoListPersonal,true);
    titleController.clear();
  }

  void _editTodo(int index,String editTodo) async {
    if (editTodo.isEmpty) return;
    setState(() {
      todoListPersonal[index]=editTodo;
    });
    await SharedPrefHelper.saveTodoListAll(todoListPersonal,true);
    titleController.clear();
  }

  void _deleteTodo(int index) async {
    setState(() {
      todoListPersonal.removeAt(index);
    });
    await SharedPrefHelper.saveTodoListAll(todoListPersonal,true);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.65;
    final tobdoBloc = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: height,
            width: double.infinity,
            child: BlocBuilder<TodoBloc, TodoState>(
              bloc: tobdoBloc,
              buildWhen: (prev, curr) =>
                  prev.todoList_Personal != curr.todoList_Personal,
              builder: (context, state) {
                List<String> todos =todoListPersonal ?? [];
                if (todos.isEmpty) {
                  return Center(
                    child: Text(
                      "No Todo found.",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: IconButton(
                          onPressed: () {
                            context.read<TodoBloc>().add(
                              isComplettedTodo(complettedIndex: index),
                            );
                          },
                          icon: state.isChecked
                              ? Icon(Icons.check_box)
                              : Icon(Icons.check_box_outline_blank),
                        ),
                        title: Text(
                          "${todos[index]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        //subtitle:,
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              BlocBuilder<TodoBloc, TodoState>(
                                bloc: tobdoBloc,
                                builder: (context, state) {
                                  return EditIconButton(
                                    index: index,
                                    onPressed: () {
                                      String titleName = titleController.text
                                          .toString();
                                      _editTodo(index, titleName);
                                      context.read<TodoBloc>().add(
                                        EditTodo_Personal(
                                          editedIndex: index,
                                          editedTitle: titleName,
                                        ),
                                      );
                                      titleController.clear();
                                      Navigator.of(context).pop();
                                    },
                                  );
                                },
                              ),
                              BlocBuilder<TodoBloc, TodoState>(
                                bloc: tobdoBloc,
                                builder: (context, state) {
                                  return IconButton(
                                    onPressed: () {
                                      _deleteTodo(index);
                                      context.read<TodoBloc>().add(
                                        DeleteTodo_Personal(deletedIndex: index),
                                      );
                                    },
                                    icon: Icon(Icons.delete, size: 28),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          CusomTextfield(
            onPressed: () {
              String titleName = titleController.text.toString();
              _addTodo(titleController.text);
              context.read<TodoBloc>().add(AddTodo_Personal(name: titleName));
              titleController.clear();
            },
          ),
        ],
      ),
    );
  }
}
