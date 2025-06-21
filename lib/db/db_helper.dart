import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  // Nama database dan versi
  static const String _dbName = 'app_database.db';
  static const int _dbVersion = 1;

  // Nama tabel
  static const String _userTable = 'users';

  // Inisialisasi database
  static Future<Database> initDatabase() async {
    if (_database != null) return _database!;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    _database = await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );

    return _database!;
  }

  // Membuat tabel user dan menambahkan akun default
  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_userTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');

    // Tambahkan akun default HRD: admin / admin123
    await db.insert(_userTable, {
      'username': 'admin',
      'password': 'admin123',
    });
  }

  // Fungsi untuk cek login
  static Future<bool> checkLogin(String username, String password) async {
    final db = await initDatabase();

    final result = await db.query(
      _userTable,
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    return result.isNotEmpty;
  }
}
