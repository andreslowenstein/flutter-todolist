part of 'todo_cubit.dart';

@immutable
abstract class TodoState {
  const TodoState();
}

class TodoLoading extends TodoState {
  const TodoLoading();
}

class TodoLoaded extends TodoState {
  const TodoLoaded({required this.todos, required this.todoModified});

  final List<Todo> todos;
  final String? todoModified;
}

class TodoError extends TodoState {
  const TodoError(this.error);

  final String error;
}
