import 'package:class_4/model/note_model.dart';
import 'package:class_4/services/note_service.dart';
import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  final noteService = NoteService();
  List<Note> notes = [];

  Future<void> getAllNotes() async {
    notes = await noteService.getAllNotes();
    notifyListeners();
  }

  Future<void> deleteNote(String id) async {
    final result = await noteService.deleteNote(id);
    if (result) {
      notes = notes.where((e) => e.id != id).toList();
    }
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    final result = await noteService.addNote(note);
    if (result) {
      notes.add(note);
    }
    notifyListeners();
  }
}
