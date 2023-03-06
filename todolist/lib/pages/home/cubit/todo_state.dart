part of 'todo_cubit.dart';

@immutable
abstract class TodoState {
  const TodoState();
}

class TodoLoading extends TodoState {
  const TodoLoading();
}

class TodoLoaded extends TodoState {
  const TodoLoaded(this.todo);

  final List<Todo> todo;
}

class TodoError extends TodoState {
  const TodoError(this.error);

  final String error;
}
