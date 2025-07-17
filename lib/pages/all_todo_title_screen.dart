// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_todo_app/Widget/variables.dart';
// import '../Widget/cusom_textfield.dart';
// import '../Widget/edit_icon_button.dart';
// import '../Widget/shared_pref_helper.dart';
// import '../bloc/todo_bloc/todo_bloc.dart';
//
// class AllTodoTitleScreen extends StatefulWidget {
//   AllTodoTitleScreen({super.key});
//   @override
//   State<AllTodoTitleScreen> createState() => _AllTodoTitleScreenState();
// }
//
// class _AllTodoTitleScreenState extends State<AllTodoTitleScreen> {
//   List<String> todoListAll = [];
//   final titleController = Variables.titleController;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadTodos();
//   }
//
//   void _loadTodos() async {
//     final todos = await SharedPrefHelper.loadTodoListAll();
//     setState(() {
//       todoListAll = todos;
//     });
//   }
//
//   void _addTodo(String newTodo) async {
//     if (newTodo.isEmpty) return;
//     setState(() {
//       todoListAll.add(newTodo);
//     });
//     await SharedPrefHelper.saveTodoListAll(todoListAll);
//     titleController.clear();
//   }
//   void _editTodo(int index,String editTodo) async {
//     if (editTodo.isEmpty) return;
//     setState(() {
//       todoListAll[index]=editTodo;
//     });
//     await SharedPrefHelper.saveTodoListAll(todoListAll);
//     titleController.clear();
//   }
//
//
//   void _deleteTodo(int index) async {
//     setState(() {
//       todoListAll.removeAt(index);
//     });
//     await SharedPrefHelper.saveTodoListAll(todoListAll);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height * 0.65;
//     final tobdoBloc = BlocProvider.of<TodoBloc>(context);
//
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Container(
//             height: height,
//             width: double.infinity,
//             child: BlocBuilder<TodoBloc, TodoState>(
//               bloc: tobdoBloc,
//               builder: (context, state) {
//                 final todos = todoListAll??[];
//                 if (todos.isEmpty) {
//                   return Center(
//                     child: Text(
//                       "No Todo found.",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   );
//                 } else {
//                   return ListView.builder(
//                     itemCount: todos.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         leading: IconButton(
//                           onPressed: () {
//                             context.read<TodoBloc>().add(
//                               isComplettedTodo(complettedIndex: index),
//                             );
//                           },
//                           icon: state.isChecked
//                               ? Icon(Icons.check_box)
//                               : Icon(Icons.check_box_outline_blank),
//                         ),
//                         title: Text(
//                           "${todos[index]}",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                         //subtitle:Text(DateTime.now().toString()),
//                         trailing: SizedBox(
//                           width: 100,
//                           child: Row(
//                             children: [
//                               BlocBuilder<TodoBloc, TodoState>(
//                                 bloc: tobdoBloc,
//                                 builder: (context, state) {
//                                   return EditIconButton(
//                                     index: index,
//                                     onPressed: () {
//                                       String titleName = titleController.text.toString();
//                                       _editTodo(index, titleName);
//                                       context.read<TodoBloc>().add(EditTodo_All(editedIndex: index, editedTitle: titleName,));
//                                       titleController.clear();
//                                       Navigator.pop(context);
//                                     },
//                                   );
//                                 },
//                               ),
//                               BlocBuilder<TodoBloc, TodoState>(
//                                 bloc: tobdoBloc,
//                                 builder: (context, state) {
//                                   return IconButton(
//                                     onPressed: () {
//                                       _deleteTodo(index);
//                                       context.read<TodoBloc>().add(DeleteTodo_All(deletedIndex: index),);
//                                     },
//                                     icon: Icon(Icons.delete, size: 28),
//                                   );
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//           Row(
//             children: [
//               CusomTextfield(
//                 onPressed: () {
//                   String titleName = titleController.text.toString();
//                   _addTodo(titleController.text);
//                   context.read<TodoBloc>().add(AddTodo_All(name: titleName));
//                   titleController.clear();
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
















