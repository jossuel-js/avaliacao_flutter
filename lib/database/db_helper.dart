import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute('''CREATE TABLE data(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      email TEXT,
      password TEXT
)''');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("usuarios.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }
 
  static Future<int>createData(String email , String password) async{
    final db = await SQLHelper.db();

    final data = {'email': email , 'password':password};
    final id = await db.insert('data', data,conflictAlgorithm:sql.ConflictAlgorithm.replace);

    return id;
  }

    static Future<List<Map<String, dynamic >>> getAllData() async{
      final db = await SQLHelper.db();
      return db.query('data', orderBy: 'id');

    }

  

    
}
