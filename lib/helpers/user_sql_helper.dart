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

    static Future<sql.Database> db() async {
    return sql.openDatabase(
      'dbtech.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

    // Create new item (journal)
  static Future<int> createItem(String firstName, String? lastName, String? image, String? businessLine, String? department) async {
    final db = await UserSQLHelper.db();

    final data = {'first_name': firstName, 'last_name': lastName, 'image': image, 'business_line':businessLine, 'department':department};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

    // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await UserSQLHelper.db();
    return db.query('items', orderBy: "id");
  }

}