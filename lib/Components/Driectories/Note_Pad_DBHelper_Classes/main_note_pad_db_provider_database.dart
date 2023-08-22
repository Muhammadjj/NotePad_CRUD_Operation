import 'package:note_pad2/Components/Driectories/Recycle_Bin_Note_Pad_DBHelper_Class/main_recycle_bin_db_provider_database.dart';
import 'package:sqflite/sqflite.dart';
import '../../../Models/note_pad_model_class.dart';
import 'main_note_pad_dbhelper.dart';

class NotePadProvider {
  static const String notePadTableName = "NotePad";
  static const String columID = "id";
  static const String columTitle = "title";
  static const String columDescription = "description";
  static const String createTable =
      """CREATE TABLE $notePadTableName($columID INTEGER PRIMARY KEY AUTOINCREMENT,$columTitle TEXT,$columDescription TEXT)""";

  // Todo:  Insert function help this inserting this data .
  Future<bool> insertNotePad({NotePadModelClass? modelClass}) async {
    Database db = await NotePadDBHelper.dataBaseFunction;
    int rowID = await db.insert(notePadTableName, modelClass!.toMap());
    return rowID == 1;
  }

  // Todo: Fetching function means data ko view krwany ka method
  Future<List<NotePadModelClass>> getNotePad() async {
    Database db = await NotePadDBHelper.dataBaseFunction;
    List<Map<String, dynamic>> data = await db.query(notePadTableName);
    return data
        .map((mainScreen) => NotePadModelClass.fromMap(mainScreen))
        .toList();
  }

  // Todo: update function means ka apny insert data ko update krny ka function .
  Future<bool> updateNotePad({required NotePadModelClass modelClass}) async {
    Database db = await NotePadDBHelper.dataBaseFunction;
    int rowID = await db.update(notePadTableName, modelClass.toMap(),
        where: '$columID = ? ', whereArgs: [modelClass.id]);
    return rowID == 1;
  }

  // Todo: delete function means apna insert data ko delete krny ka method.
  Future<bool> deleteNotePad({required int? id}) async {
    Database db = await NotePadDBHelper.dataBaseFunction;
    final note = await db.query(notePadTableName, where: "$columID = ? ", whereArgs: [id]);
    await db.insert(RecycleBinProvider.recycleBinTableName, note.first);
    int rowID = await db.delete(notePadTableName, where: '$columID = ? ', whereArgs: [id]);
    return rowID >= 0;
  }
}


// class DatabaseHelper {
//   final Future<Database> database;


//   Future<void> deleteNoteAndMoveToHistory(int id) async {
//     final db = await database;

//     // Retrieve the note to delete
//     final note = await db.query('notes', where: 'id = ?', whereArgs: [id]);

//     // Insert the deleted note into the history table
//     await db.insert('history', note.first);

//     // Delete the note from the notes table
//     await db.delete('notes', where: 'id = ?', whereArgs: [id]);
//   }
// }