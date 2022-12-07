import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'MapMarker.dart';
import 'db_utils_marker.dart';
import 'account.dart';

class MarkerInterface{

  Future<int> createMarker(MapMarker mapmarker) async{
    final db = await DBUtilsMarker.init();
    return db.insert(
      'marker_db', //table you are inserting items into
      mapmarker.toMap(), //what you are pushing into db
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future getAllMarker() async{
    final db = await DBUtilsMarker.init();
    final List maps = await db.query('marker_db');
    List<MapMarker> result = [];
    if (maps.length > 0){
      for (int i = 0; i < maps.length; i++){
        result.add(MapMarker.fromMap(maps[i]));
      }
    }
    return result;
  }

  // Future<int> updateAcc(Acc acc) async{
  //   final db = await DBUtils.init();
  //   return db.update(
  //     'marker_db', //table you are inserting items into
  //     acc.toMap(), //what you are pushing into db
  //     where: 'username = ?',
  //     whereArgs: [acc.username],
  //   );
  // }

  // Future<int> deleteAccWithUsername(String username) async{
  //   final db = await DBUtils.init();
  //   return db.delete(
  //     'marker_db', //table you are inserting items into
  //     where: 'username = ?',
  //     whereArgs: [username],
  //   );
  // }
}