import 'package:class_4/model/note_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteService {
  final _notesRef = FirebaseFirestore.instance.collection('notes');

  Future<bool> addNote(Note note) async {
    try {
      await _notesRef.doc(note.id).set(note.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> updateNote(Note note) async {
    await _notesRef.doc(note.id).update(note.toMap());
  }

  Future<Note?> getNoteById(String id) async {
    final doc = await _notesRef.doc(id).get();
    if (doc.exists) {
      return Note.fromMap(doc.id, doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  Future<List<Note>> getAllNotes() async {
    final snapshot = await _notesRef.get();
    return snapshot.docs
        .map((doc) => Note.fromMap(doc.id, doc.data()))
        .toList();
  }

  Future<bool> deleteNote(String id) async {
    try {
      await _notesRef.doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
