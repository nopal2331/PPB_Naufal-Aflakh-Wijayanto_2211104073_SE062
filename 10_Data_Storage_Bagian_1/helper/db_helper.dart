import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'mydb_unguided10.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE my_unguided10(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nama TEXT NOT NULL,
  nim TEXT NOT NULL,
  alamat TEXT NOT NULL,
  hobi TEXT NOT NULL
)
''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      // Tambahkan logika jika ada perubahan struktur tabel di versi berikutnya
    }
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert(
      'my_unguided10',
      row,
      conflictAlgorithm: ConflictAlgorithm.replace, // Mencegah duplikasi data
    );
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query('my_unguided10', orderBy: 'id DESC');
  }

  Future<int> update(int id, Map<String, dynamic> row) async {
    Database db = await database;
    return await db.update(
      'my_unguided10',
      row,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteRow(int id) async {
    Database db = await database;
    return await db.delete(
      'my_unguided10',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAll() async {
    Database db = await database;
    await db.delete('my_unguided10');
  }

  Future<int> countRows() async {
    Database db = await database;
    return Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM my_unguided10'),
    )!;
  }

  Future<void> closeDatabase() async {
    Database db = await database;
    await db.close();
    _database = null; // Reset agar database dapat di-reopen
  }
}