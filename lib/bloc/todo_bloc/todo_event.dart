
part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable{

  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class AddTodo_All extends TodoEvent{
  String name;
  AddTodo_All({required this.name});
}
class AddTodo_Personal extends TodoEvent{
  String name;
  AddTodo_Personal({required this.name});
}
class AddTodo_Work extends TodoEvent{
  String name;
  AddTodo_Work({required this.name,});
}


class EditTodo_All extends TodoEvent{
  int editedIndex;
  String editedTitle;
  EditTodo_All({required this.editedIndex,required this.editedTitle});
}
class EditTodo_Personal extends TodoEvent{
  int editedIndex;
  String editedTitle;
  EditTodo_Personal({required this.editedIndex,required this.editedTitle});
}
class EditTodo_Work extends TodoEvent{
  int editedIndex;
  String editedTitle;
  EditTodo_Work({required this.editedIndex,required this.editedTitle});
}


class DeleteTodo_All extends TodoEvent{
  int deletedIndex;
  DeleteTodo_All({required this.deletedIndex});
}
class DeleteTodo_Personal extends TodoEvent{
  int deletedIndex;
  DeleteTodo_Personal({required this.deletedIndex});
}
class DeleteTodo_Work extends TodoEvent{
  int deletedIndex;
  DeleteTodo_Work({required this.deletedIndex});
}



class isComplettedTodo extends TodoEvent{
  int complettedIndex;
  isComplettedTodo({required this.complettedIndex});
}
class AppMood extends TodoEvent{
   bool isDark;
  AppMood({required this.isDark}):super();
}

