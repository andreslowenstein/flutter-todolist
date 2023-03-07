import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/models/todo.dart';

class TodoRepository {
  FirebaseFirestore getInstance = Service().getInstance();

  TodoRepository({required this.getInstance});

  Future<List<Todo>> getTodos() async {
    final snapshot = await getInstance
        .collection("todos")
        .where("Checked", isEqualTo: false)
        .get();

    final data = snapshot.docs.map((e) => Todo.fromSnapshot(e)).toList();

    return data;
  }

  Future<bool> updateTodo(String id, String todo) async {
    await getInstance.collection("todos").doc(id).update({
      "Todo": todo,
      "Date": Timestamp.now(),
    });

    return true;
  }

  Future<bool> markedAsDone(String id) async {
    await getInstance.collection("todos").doc(id).update({"Checked": true});

    return true;
  }

  Future<bool> newTodo(String todo) async {
    await getInstance.collection("todos").add({
      "Todo": todo,
      "Checked": false,
      "Date": Timestamp.now(),
    });

    return true;
  }
}

class Service {
  FirebaseFirestore getInstance() {
    var instance = FirebaseFirestore.instance;
    return instance;
  }
}
