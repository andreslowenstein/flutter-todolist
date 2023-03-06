import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo({
    required this.id,
    required this.todo,
    required this.checked,
  });

  final String id;
  final String todo;
  final bool checked;

  factory Todo.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Todo(
      id: document.id,
      todo: data["Todo"],
      checked: data["Checked"],
    );
  }
}
