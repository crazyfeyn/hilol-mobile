import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

enum CartDBKey { category }

class CartDB {
  static Database? _db;
  static const int _version = 1;
  static const String _dbName = 'cart_1.db';

  static Future<void> _init() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async {

        await db.execute(
          """CREATE TABLE ${CartDBKey.category.name}
          (id INTEGER PRIMARY KEY,
          image TEXT,
          title TEXT,
          description TEXT,
          brand TEXT,
          amount INTEGER,
          currency TEXT,
          price REAL,
          measurementId INTEGER,
          count INTEGER,
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);""",
        );
      },
      version: _version,
    );
  }

  static Future<int> setCart(CartModel value) async {
    if (_db == null) await _init();
    return await _db!.insert(CartDBKey.category.name, value.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> fetchCarts() async {
    if (_db == null) await _init();
    return await _db!.query(CartDBKey.category.name);
  }

  static Future<Map<String, dynamic>?> fetchCartById(int id) async {
    if (_db == null) await _init();
    final List<Map<String, dynamic>> result = await _db!.query(
      CartDBKey.category.name,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  static Future<int> deleteCartById(int id) async {
    if (_db == null) await _init();
    return await _db!.delete(
      CartDBKey.category.name,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> deleteAllCarts() async {
    if (_db == null) await _init();
    return await _db!.delete(CartDBKey.category.name);
  }
}