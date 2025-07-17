// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPrefHelper {
//   static const _personalKey = 'todo_personal';
//   static const _workKey = 'todo_work';
//
//   static Future<void> saveAllTodos(List<String> todos) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList(_personalKey, todos);
//   }
//
//   static Future<void> savePersonalTodos(List<String> todos) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList(_personalKey, todos);
//   }
//
//   static Future<void> saveWorkTodos(List<String> todos) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList(_workKey, todos);
//   }
//
//   static Future<List<String>> loadAllTodos() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getStringList(_personalKey) ?? [];
//   }
//
//   static Future<List<String>> loadPersonalTodos() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getStringList(_personalKey) ?? [];
//   }
//
//   static Future<List<String>> loadWorkTodos() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getStringList(_workKey) ?? [];
//   }
// }

// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPrefHelper {
//   static const String _keyTodoListAll = 'todoList_All';
//   static List<String> todos=[];
//
//   static Future<void> saveTodoListAll(String todo) async {
//     final prefs = await SharedPreferences.getInstance();
//     todos.add(todo);
//     await prefs.setStringList(_keyTodoListAll, todos);
//   }
//
//   static Future<void> deleteTodoListAll(int index) async {
//     final prefs = await SharedPreferences.getInstance();
//     todos.removeAt(index);
//     await prefs.setStringList(_keyTodoListAll, todos);
//   }
//
//   static Future<void> editTodoListAll(int editedIndex,String editedTitle) async {
//     final prefs = await SharedPreferences.getInstance();
//     todos[editedIndex]=editedTitle;
//     await prefs.setStringList(_keyTodoListAll, todos);
//   }
//
//   static Future<List<String>> loadTodoListAll() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getStringList(_keyTodoListAll) ?? [];
//   }
// }


import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static const String keyTodoListPersonal = 'todoList_Personal';
  static const String keyTodoListWork = 'todoList_Work';

  static Future<void> saveTodoListAll(List<String> todos,bool isPersonal) async {
    final prefs = await SharedPreferences.getInstance();
    if(isPersonal){
      await prefs.setStringList(keyTodoListPersonal, todos);
    }else{
      await prefs.setStringList(keyTodoListWork, todos);
    }
  }

  static Future<List<String>> loadTodoListAll(bool isPersonal) async {
    final prefs = await SharedPreferences.getInstance();
    if(isPersonal){
      return prefs.getStringList(keyTodoListPersonal) ?? [];
    }else{
      return prefs.getStringList(keyTodoListWork) ?? [];
    }
  }
}


// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPrefHelper {
//   static const String keyTodoListAll = 'todoList_All';
//   static List<String> todoListAll_Shared = [];
//
//   static Future<void> addTodoList_All_Shared(String todo) async {
//     final prefs = await SharedPreferences.getInstance();
//     todoListAll_Shared.add(todo);
//     await prefs.setStringList(keyTodoListAll, todoListAll_Shared);
//   }
//
//   static Future<void> editTodoList_All_Shared(int index,String todo) async {
//     final prefs = await SharedPreferences.getInstance();
//     todoListAll_Shared[index]=todo;
//     await prefs.setStringList(keyTodoListAll, todoListAll_Shared);
//   }
//
//   static Future<void> deleteTodoList_All_Shared(int index) async {
//     final prefs = await SharedPreferences.getInstance();
//     todoListAll_Shared.removeAt(index);
//     await prefs.setStringList(keyTodoListAll, todoListAll_Shared);
//   }
//
//   static Future<List<String>> loadTodoListAll_Shared() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getStringList(keyTodoListAll) ?? [];
//   }
// }
