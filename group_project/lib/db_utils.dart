import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DBUtils{
  static Future init() async{
    var database = openDatabase(
        path.join(await getDatabasesPath(), 'local_variables.db'),
        onCreate: (db, version){
          db.execute('CREATE TABLE local_db(username TEXT PRIMARY KEY, color TEXT, password TEXT, email TEXT)');
          db.execute('CREATE TABLE marker_db(id INTEGER PRIMARY KEY, username TEXT, rating INTEGER, latitude DOUBLE, longitude DOUBLE)');
        },
        version:1
    );
    print("created DB $database");
    return database;
  }
}