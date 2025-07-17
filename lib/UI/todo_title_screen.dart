import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/Widget/custom_appbar.dart';
import 'package:my_todo_app/pages/all_todo_title_screen.dart';
import 'package:my_todo_app/pages/personal_todo_title_screen.dart';
import 'package:my_todo_app/pages/work_todo_title_screen.dart';
import '../Widget/my_drawer.dart';

class TodoTitleScreen extends StatelessWidget {
  TodoTitleScreen({super.key});

  PageController pageController = PageController();
  List<Widget> pageList = <Widget>[];
  bool isPressed=false;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar:const CustomAppbar(),
        drawer: MyDrawer(),
        body:SafeArea(
          child: TabBarView(children: [
            //AllTodoTitleScreen(),
            PersonalTodoTitleScreen(),
            WorkTodoTitleScreen(),
          ]),
        ),
      ),
    );
  }
}


