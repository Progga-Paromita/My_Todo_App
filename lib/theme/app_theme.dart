import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/UI/todo_title_screen.dart';
import '../bloc/todo_bloc/todo_bloc.dart';

class AppMoodClass extends StatelessWidget {
  const AppMoodClass({super.key});

  @override
  Widget build(BuildContext context) {
    final tobdoBloc = BlocProvider.of<TodoBloc>(context);

    return BlocBuilder<TodoBloc, TodoState>(
      bloc: tobdoBloc,
      builder: (context, state) {
        if (state.isDark) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              buttonTheme: ButtonThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
              ),
            ),
            home: TodoTitleScreen(),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(useMaterial3: true),
            home: TodoTitleScreen(),
          );
        }
      },
    );
  }
}
