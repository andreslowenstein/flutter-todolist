import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/services/todo_service.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit(this._service) : super(const TodoLoading());

  final TodoService _service;

  Future<void> getTodos() async {
    emit(const TodoLoading());

    try {
      // final todos = await _service.getTodos();
    } catch (e) {
      emit(
        TodoError(e.toString()),
      );
    }
  }
}
