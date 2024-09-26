import 'package:flutter/material.dart';

import '../services/firebase_services.dart';

class NotesDetailScreen extends StatelessWidget {
  const NotesDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              FirebaseServices().addNote();
            },
            child: Text('Save')),
      ),
    );
  }
}
