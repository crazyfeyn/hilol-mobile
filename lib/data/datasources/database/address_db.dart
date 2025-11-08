import 'package:commerce_mobile/data/models/address_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

enum AddressDBKey { address }

class AddressDB {
  static Database? _db;
  static const int _version = 1;
  static const String _dbName = 'address_1.db';

  static Future<void> _init() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async {
        await db.execute("""CREATE TABLE ${AddressDBKey.address.name}
          (id INTEGER PRIMARY KEY AUTOINCREMENT,
          latitude REAL,
          longitude REAL,
          address TEXT,
          receiver_name TEXT,
          home_number TEXT,
          entrance_password TEXT,
          phone_number TEXT,
          city TEXT,
          region TEXT,
          street TEXT,
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);""");
      },
      version: _version,
    );
  }

  static Future<int> setAddress(AddressModel value) async {
    print('11111');
    print(value.address);
    print(value.city);
    print(value.entrancePassword);
    print(value.homeNumber);
    print(value.phoneNumber);
    print(value.receiverName);
    print(value.region);
    print(value.street);
    if (_db == null) await _init();
    await _db!.delete(AddressDBKey.address.name);
    return await _db!.insert(
      AddressDBKey.address.name,
      value.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<AddressModel?> fetchAddress() async {
    print('keldi');
    if (_db == null) await _init();

    final List<Map<String, dynamic>> result = await _db!.query(
      AddressDBKey.address.name,
      orderBy: 'created_at DESC',
      limit: 1,
    );

    if (result.isNotEmpty) {
      print('success');
      return AddressModel.fromMap(result.first);
    }
    print('shu yer');
    return null;
  }

  static Future<int> deleteAddressById(int id) async {
    if (_db == null) await _init();
    return await _db!.delete(
      AddressDBKey.address.name,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> updateAddress(int id, AddressModel value) async {
    print('shu yerda');
    if (_db == null) await _init();
    return await _db!.update(
      AddressDBKey.address.name,
      value.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
