import 'package:note_pad2/Components/Driectories/Recycle_Bin_Note_Pad_DBHelper_Class/main_recycle_bin_db_provider_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'main_note_pad_db_provider_database.dart';

class NotePadDBHelper {
  static const String dataBaseName = "notepad.db";
  static const int dataBaseVersion = 3;
  static Database? _database;

  static Future<Database> get dataBaseFunction async {
    ///* (getDatabasesPath) as laya use hota ha q ka as app ma jo bhi data
    ///* (CRUD) operation sa get ho ga wo data app ma store krwany ka laya
    ///*(getDatabasesPath) asy use krty ha ya ak trha as dataBase ki location ha.
    ///* aur ak temporary folder hmre app ka create kr dyta ha jo hmra Mobile ki files
    ///* ma save ho jate ha
    String directory = await getDatabasesPath();

    ///* ab hm na apny (CRUD) operation sa aya howa data ko js jaga save
    ///* krwana ha asy koi (name) dy ga ase waja sa hm ny (join function)
    ///* ko use kya ha
    ///* What is join? join function table bnany ka km nhi ata blka {join path}
    ///* ko handle krta ha . Join function real ma two thing ko combine krny ka
    ///* laya use hota haa
    String path = join(directory, dataBaseName);
    return _database ??
        await openDatabase(
          path,
          version: dataBaseVersion,
          onCreate: (Database db, int version) {
            db.execute(NotePadProvider.createTable);
            db.execute(RecycleBinProvider.recycleBinCreateTable);
          },
        );
  }
}
