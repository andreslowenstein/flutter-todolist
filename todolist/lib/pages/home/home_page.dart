import 'package:flutter/material.dart';
import 'package:todolist/models/todo.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.todos,
  });

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List App"),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: ((context, index) {
          final todo = todos[index];
          return Text(todo.todo);
        }),
      ),
    );
  }
}
