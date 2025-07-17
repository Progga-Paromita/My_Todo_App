import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/Widget/variables.dart';
import 'package:my_todo_app/theme/color_pallete/pallete.dart';
import '../bloc/todo_bloc/todo_bloc.dart';
import 'custom_border.dart';

class CusomTextfield extends StatelessWidget {

  CusomTextfield({super.key, required this.onPressed});
  final VoidCallback onPressed;
  final border = CustomBorder.border;
  final title = Variables.titleController;

  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context);
    //final width=MediaQuery.of(context).size.height;
    return Expanded(
      child: BlocBuilder<TodoBloc, TodoState>(
        bloc: todoBloc,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Stack(
                children: [
                  // Gradient Background
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Pallete.gradient3,
                          Pallete.gradient2,
                          Pallete.gradient1,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  // TextField with transparent fill and no extra padding

                  TextField(
                    controller: title,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: "+ Add Item",
                      hintStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      focusedBorder: border,
                      enabledBorder: border,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    onSubmitted: (titlename) =>onPressed(),

                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// TextField(
// controller: title,
// decoration: InputDecoration(
// filled: true,
// fillColor: Colors.transparent,
// hintText: "+ Add Item",
// hintStyle: TextStyle(fontSize: 20, color: Colors.white),
// focusedBorder: border,
// enabledBorder: border,
// contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
// ),
// style: TextStyle(color: Colors.white),
// onSubmitted: (titlename) {
// String titleName = title.text.toString();
// context.read<TodoBloc>().add(AddTodo(name: titleName));
// },
// ),
