import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/services/firebase_services.dart';

import '../models/notes.dart';
import 'notes_detail_screen.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseServices().fetchNotes(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return snapshot.data!.docs.length > 0
              ? ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    Note note = Note(
                        id: document.id,
                        title: data['title'],
                        description: data['description']);
                    return GestureDetector(
                      onDoubleTap: () {
                        FirebaseServices().deleteNote(note.id);
                      },
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                NotesDetailScreen(note: note)));
                      },
                      child: ListTile(
                        title: Text(note.title!),
                        subtitle: Text(note.description!),
                      ),
                    );
                  }).toList(),
                )
              : Center(child: Text('Oops no notes available!!!'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NotesDetailScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
