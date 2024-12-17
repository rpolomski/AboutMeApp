import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LoginDatabaseHelper {
  static const _databaseName = "userDatabase.db";
  static const _databaseVersion = 1;

  static const table = 'user_table';
  static const columnId = 'id';
  static const columnUsername = 'username';
  static const columnPassword = 'password';

  LoginDatabaseHelper._privateConstructor();
  static final LoginDatabaseHelper instance = LoginDatabaseHelper._privateConstructor();

  static Database? _database;

    Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

    Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnUsername TEXT NOT NULL,
        $columnPassword TEXT NOT NULL
      )
    ''');
  }

    Future<int> insertUser(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert(table, row);
  }

    Future<List<Map<String, dynamic>>> queryUser(String username, String password) async {
    Database db = await database;
    return await db.query(table,
        where: '$columnUsername = ? AND $columnPassword = ?',
        whereArgs: [username, password]);
  }
}
