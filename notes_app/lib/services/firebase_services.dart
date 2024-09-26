import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  var db = FirebaseFirestore.instance;
  addNote() {
    // Create a new user with a first and last name
    final note = <String, dynamic>{
      "title": "First Note",
      "description": "No description"
    };

// Add a new document with a generated ID
    db.collection("notes").add(note).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }
}
