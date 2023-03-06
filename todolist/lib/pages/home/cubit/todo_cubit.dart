import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/repository/todo_repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit(this._repository) : super(const TodoLoading());

  final TodoRepository _repository;
  List<Todo> todos = <Todo>[];

  Future<void> getTodos() async {
    emit(const TodoLoading());

    try {
      todos = await _repository.getTodos();

      emit(TodoLoaded(todos: todos, todoModified: null));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  void todoModified(String todo) {
    emit(TodoLoaded(todos: todos, todoModified: todo));
  }

  Future<void> updateTodo(String id, String todo) async {
    try {
      emit(const TodoLoading());

      bool resp = await _repository.updateTodo(id, todo);

      if (!resp) emit(const TodoError("An error has ocurred"));

      getTodos();
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> markedAsDone(String id) async {
    try {
      emit(const TodoLoading());

      bool resp = await _repository.markedAsDone(id);

      if (!resp) emit(const TodoError("An error has ocurred"));

      getTodos();
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> newTodo(String todo) async {
    try {
      emit(const TodoLoading());

      bool resp = await _repository.newTodo(todo);

      if (!resp) emit(const TodoError("An error has ocurred"));

      getTodos();
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }
}
