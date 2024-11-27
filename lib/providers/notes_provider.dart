import 'package:flutter/foundation.dart';
import '../models/note.dart';

class NotesProvider with ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes => List.unmodifiable(_notes);

  void addNote(String title, String content) {
    final note = Note(
      id: DateTime.now().toString(),
      title: title,
      content: content,
      dateCreated: DateTime.now(),
    );
    _notes.add(note);
    notifyListeners();
  }

  void deleteNote(String id) {
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }

  void updateNote(String id, String title, String content) {
    final index = _notes.indexWhere((note) => note.id == id);
    if (index >= 0) {
      _notes[index] = Note(
        id: id,
        title: title,
        content: content,
        dateCreated: _notes[index].dateCreated,
      );
      notifyListeners();
    }
  }
}
