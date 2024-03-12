import 'package:flutter/foundation.dart';
import 'package:flutter_sqlite_app/helpers/sql_helper.dart';
import 'package:sqflite/sqflite.dart' as sql;

class UserSQLHelper {
    // Create new item (journal)
  static Future<int> createItem(String firstName, String? lastName, String? image, String? businessLine, String? department) async {
    final db = await SQLHelper.db();

    final data = {'firstName': firstName, 'lastName': lastName, 'image': image, 'businessLine':businessLine, 'department':department};
    final id = await db.insert('users', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

    // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('users', orderBy: "id");
  }

  
  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('users', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, String firstName, String? lastName, String? image, String? businessLine, String? department) async {
    final db = await SQLHelper.db();

    final data = {
      'firstName': firstName,
      'lastName': lastName,
      'image':image,
      'businessLine':businessLine,
      'department':department,
      'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('users', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

    // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("users", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

}