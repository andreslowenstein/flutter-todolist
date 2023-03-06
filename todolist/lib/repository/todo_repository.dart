import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/models/todo.dart';

class TodoRepository {
  // static TodoRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<Todo>> getTodos() async {
    final snapshot =
        await _db.collection("todos").where("Checked", isEqualTo: false).get();

    final data = snapshot.docs.map((e) => Todo.fromSnapshot(e)).toList();

    return data;
  }

  Future<bool> updateTodo(String id, String todo) async {
    await _db.collection("todos").doc(id).update({"Todo": todo});

    return true;
  }

  Future<bool> markedAsDone(String id) async {
    await _db.collection("todos").doc(id).update({"Checked": true});

    return true;
  }

  Future<bool> newTodo(String todo) async {
    await _db.collection("todos").add({"Todo": todo, "Checked": false});

    return true;
  }
}
