import 'package:class_4/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../providers/note_provider.dart';

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = context.read<NoteProvider>();

    final textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(controller: textController, maxLines: 5),

            IconButton(
              onPressed: () {
                final note = Note(
                  id: Uuid().v1(),
                  date: '21 Jun 2025',
                  day: 'Saturday',
                  text: textController.text,
                );
                noteProvider.addNote(note);
                print(textController.text);
              },
              icon: Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}
