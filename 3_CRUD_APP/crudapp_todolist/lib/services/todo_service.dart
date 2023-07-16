import 'package:cloud_firestore/cloud_firestore.dart';

class TodoService {
  Future<void> createTodos(String input) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyTodos").doc();

    Map<String, String> todosData = {"todoTitle": input};

    await documentReference.set(todosData).then((_) {
      print("$input created");
    }).catchError((error) {
      print("Failed to create todo: $error");
    });
  }

  Future<void> updateTodos(String docId, String newTitle) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyTodos").doc(docId);

    Map<String, dynamic> todosData = {"todoTitle": newTitle};

    await documentReference.update(todosData).then((_) {
      print("$docId updated to $newTitle");
    }).catchError((error) {
      print("Failed to update todo: $error");
    });
  }

  Future<void> deleteTodos(String docId) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyTodos").doc(docId);

    await documentReference.delete().then((_) {
      print("$docId deleted");
    }).catchError((error) {
      print("Failed to delete todo: $error");
    });
  }
}
