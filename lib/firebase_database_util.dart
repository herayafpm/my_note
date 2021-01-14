import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:my_note/note_model.dart';

class FirebaseDatabaseUtil {
  DatabaseReference _notesRef;
  FirebaseDatabase database = new FirebaseDatabase();
  DatabaseError error;

  static final FirebaseDatabaseUtil _instance =
      new FirebaseDatabaseUtil.internal();
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseDatabaseUtil.internal();

  factory FirebaseDatabaseUtil() {
    return _instance;
  }

  void initState() {
    _notesRef = database.reference().child('notes').child(auth.currentUser.uid);
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
  }

  DatabaseError getError() {
    return error;
  }

  DatabaseReference getNotes() {
    return _notesRef;
  }

  addNote(NoteModel note) async {
    _notesRef.push().set(<String, String>{
      "title": note.title,
      "content": note.content,
    }).then((_) {
      print('Transaction  committed.');
    });
  }

  void deleteNote(NoteModel note) async {
    await _notesRef.child(note.uid).remove().then((_) {
      print('Transaction  committed.');
    });
  }

  void updateNote(NoteModel note) async {
    await _notesRef.child(note.uid).update({
      "title": note.title,
      "content": note.content,
    }).then((_) {
      print('Transaction  committed.');
    });
  }
}
