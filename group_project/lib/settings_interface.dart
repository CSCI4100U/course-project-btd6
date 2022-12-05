import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'db_utils.dart';
import 'account.dart';

class PageInterface{

  Future<int> createAcc(Acc acc) async{
    final db = await DBUtils.init();
    return db.insert(
      'local_db', //table you are inserting items into
      acc.toMap(), //what you are pushing into db
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future getAllPosts() async{
    final db = await DBUtils.init();
    final List maps = await db.query('local_db');
    List<Acc> result = [];
    if (maps.length > 0){
      for (int i = 0; i < maps.length; i++){
        result.add(Acc.fromMap(maps[i]));
      }
    }
    return result;
  }

  Future<int> updatePost(Acc acc) async{
    final db = await DBUtils.init();
    return db.update(
      'local_db', //table you are inserting items into
      acc.toMap(), //what you are pushing into db
      where: 'title = ?',
      whereArgs: [acc.title],
    );
  }

  Future<int> deletePostWithUsername(String title) async{
    final db = await DBUtils.init();
    return db.delete(
      'local_db', //table you are inserting items into
      where: 'title = ?',
      whereArgs: [title],
    );
  }
}