import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class UserSQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        first_name TEXT,
        last_name TEXT,
        image TEXT,
        business_line TEXT,
        department TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
}