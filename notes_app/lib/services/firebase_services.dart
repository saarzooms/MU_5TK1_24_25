import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  var db = FirebaseFirestore.instance;
  addNote(String title, String description) {
    // Create a new note with a title and description
    final note = <String, dynamic>{"title": title, "description": description};

// Add a new document with a generated ID
    db.collection("notes").add(note).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Stream<QuerySnapshot> fetchNotes() {
    Stream<QuerySnapshot> collectionStream =
        FirebaseFirestore.instance.collection('notes').snapshots();
    return collectionStream;
// Stream documentStream = FirebaseFirestore.instance.collection('users').doc('ABC123').snapshots();
  }
}
