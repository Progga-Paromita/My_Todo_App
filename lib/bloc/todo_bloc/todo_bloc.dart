import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widget/shared_pref_helper.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  TodoBloc() : super( TodoState()) {
    on<AddTodo_All>(_addTodo_All);
    on<AddTodo_Personal>(_addTodo_Personal);
    on<AddTodo_Work>(_addTodo_Work);
    on<DeleteTodo_All>(_deleteTodo_All);
    on<DeleteTodo_Personal>(_deleteTodo_Personal);
    on<DeleteTodo_Work>(_deleteTodo_Work);
    on<EditTodo_All>(_editTodo_All);
    on<EditTodo_Personal>(_editTodo_Personal);
    on<EditTodo_Work>(_editTodo_Work);
    on<AppMood>(_appMood);
    on<isComplettedTodo>(_isCompletedTodo);
  }



  void _addTodo_All(AddTodo_All event, Emitter<TodoState> emit) async {
    //await SharedPrefHelper.addTodoListAll(event.name);
    emit(state.copyWith(name_All: event.name,));
  }

  void _addTodo_Personal(AddTodo_Personal event, Emitter<TodoState> emit) {
    emit(state.copyWith(name_Personal: event.name,
    ));
  }

  void _addTodo_Work(AddTodo_Work event, Emitter<TodoState> emit) {
    emit(state.copyWith(name_Work: event.name,
    ));
  }

  void _editTodo_All(EditTodo_All event, Emitter<TodoState> emit) async{
    //await SharedPrefHelper.editTodoListAll(event.editedIndex,event.editedTitle);
    emit(state.copyWith(editIndex_All: event.editedIndex, editedTitle_All: event.editedTitle,
    ));
  }

  void _editTodo_Personal(EditTodo_Personal event, Emitter<TodoState> emit) {
    emit(state.copyWith(editIndex_Personal: event.editedIndex, editedTitle_Personal: event.editedTitle,
    ));
  }

  void _editTodo_Work(EditTodo_Work event, Emitter<TodoState> emit) {
    emit(state.copyWith(editIndex_Work: event.editedIndex, editedTitle_Work: event.editedTitle,
    ));
  }

  void _deleteTodo_All(DeleteTodo_All event, Emitter<TodoState> emit) async {
//await SharedPrefHelper.deleteTodoListAll(event.deletedIndex);
    emit(state.copyWith(deleteIndex_All: event.deletedIndex));
  }

  void _deleteTodo_Personal(DeleteTodo_Personal event, Emitter<TodoState> emit) {
    emit(state.copyWith(deleteIndex_Personal: event.deletedIndex,));
  }

  void _deleteTodo_Work(DeleteTodo_Work event, Emitter<TodoState> emit) {
    emit(state.copyWith(deleteIndex_Work: event.deletedIndex,));
  }

  void _isCompletedTodo(isComplettedTodo event, Emitter<TodoState> emit) {
    emit(state.copyWith(isChecked: !state.isChecked));
  }

  void _appMood(AppMood event, Emitter<TodoState> emit) {
    emit(state.copyWith(isDark: !state.isDark));
  }


}


