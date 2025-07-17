//import 'package:shared_preferences/shared_preferences.dart';
part of 'todo_bloc.dart';

class TodoState extends Equatable {

  final List<String>? todoList_All;
  final List<String>? todoList_Personal;
  final List<String>? todoList_Work;
  final int? deleteIndex_All;
  final int? deleteIndex_Personal;
  final int? deleteIndex_Work;
  final int? editIndex_All;
  final int? editIndex_Personal;
  final int? editIndex_Work;
  final String editedTitle_All;
  final String editedTitle_Personal;
  final String editedTitle_Work;
  final bool isDark;
  final bool isChecked;


   TodoState({
    this.todoList_All,
    this.todoList_Personal,
    this.todoList_Work,

    this.deleteIndex_All,
    this.deleteIndex_Personal,
    this.deleteIndex_Work,

    this.editIndex_All,
    this.editIndex_Personal,
    this.editIndex_Work,

    this.editedTitle_All= '',
    this.editedTitle_Personal='',
    this.editedTitle_Work='',

    this.isDark = false,
    this.isChecked = false,
  });

  TodoState copyWith({
    String? name_All,
    String? name_Personal,
    String? name_Work,

    int? deleteIndex_All,
    int? deleteIndex_Personal,
    int? deleteIndex_Work,

    int? editIndex_All,
    int? editIndex_Personal,
    int? editIndex_Work,

    String? editedTitle_All,
    String? editedTitle_Personal,
    String? editedTitle_Work,

    bool? isDark,
    bool? isChecked,

  }) {

    List<String>? updatedList_All = List.from(todoList_All ?? []);
    List<String>? updatedList_Personal= List.from(todoList_Personal ?? []);
    List<String>? updatedList_Work= List.from(todoList_Work ?? []);


    if (name_All != null && name_All.trim().isNotEmpty) {
      updatedList_All.add(name_All.trim());
    }
    if (name_Personal != null ) {
      updatedList_Personal.add(name_Personal);
    }
    if (name_Work!= null ) {
      updatedList_Work.add(name_Work);
    }


    if (deleteIndex_All != null) {
      updatedList_All.removeAt(deleteIndex_All);
    }
    if (deleteIndex_Personal != null) {
      updatedList_Personal.removeAt(deleteIndex_Personal);
    }
    if (deleteIndex_Work!= null) {
      updatedList_Work.removeAt(deleteIndex_Work);
    }


    if (editIndex_All != null ) {
      updatedList_All[editIndex_All] = editedTitle_All??this.editedTitle_All;
    }
    if (editIndex_Personal != null) {
      updatedList_Personal[editIndex_Personal] = editedTitle_Personal?? this.editedTitle_Personal;
    }
    if (editIndex_Work != null) {
      updatedList_Work[editIndex_Work] = editedTitle_Work ?? this.editedTitle_Work;
    }


    return TodoState(
      todoList_All: updatedList_All?? this.todoList_Personal,
      todoList_Personal: updatedList_Personal?? this.todoList_Work,
      todoList_Work: updatedList_Work,

      deleteIndex_All: deleteIndex_All?? this.deleteIndex_All,
      deleteIndex_Personal: deleteIndex_Personal ?? this.deleteIndex_Personal,
      deleteIndex_Work: deleteIndex_Work ?? this.deleteIndex_Work,

      editIndex_All: editIndex_All??this.editIndex_All,
      editedTitle_All: editedTitle_All??this.editedTitle_All,

      editIndex_Personal: editIndex_Personal??this.editIndex_Personal,
      editedTitle_Personal: editedTitle_Personal??this.editedTitle_Personal,

      editIndex_Work: editIndex_Work??this.editIndex_Work,
      editedTitle_Work: editedTitle_Work??this.editedTitle_Work,

      isDark: isDark ?? this.isDark,
      isChecked: isChecked ?? this.isChecked,

    );
  }

  @override
  List<Object?> get props => [
    todoList_All,
    todoList_Personal,
    todoList_Work,

    deleteIndex_All,
    deleteIndex_Personal,
    deleteIndex_Work,

    editIndex_All,
    editIndex_Personal,
    editIndex_Work,

    editedTitle_All,
    editedTitle_Personal,
    editedTitle_Work,

    isDark,
    isChecked,

  ];
}


