import 'dart:async';
import 'dart:io';
import 'package:dolmusproje2/plakalar.dart';
import "package:path_provider/path_provider.dart";
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;
  String _plakatablo = "plakalar";
  String _plakaadi = "plakaadi";
  String _id = "id";
  String _ver = "ver";

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper.asd();
      print("nulldi yeni oluştu");
      return _databaseHelper!;
    }
    print("var olan kullanıldı");
    return _databaseHelper!;
  }

  DatabaseHelper.asd();

  Future<Database?> _getDatabase() async {
    if (_database == null) {
      print("DB null di oluşuyor");
      _database = await initializeDatabase();
    }
    return _database;
  }

  initializeDatabase() async {
    Directory klasor = await getApplicationDocumentsDirectory();
    String path = join(klasor.path, "plakalar.db");
    print("DB PATH: " + path);
    var ogrencidb = openDatabase(path, version: 1, onCreate: createdatabase);
    return ogrencidb;
  }

  FutureOr<void> createdatabase(Database db, int version) async {
    print("create db metod çalıştı tablo oluşuyor...");
    await db.execute(
        "CREATE TABLE $_plakatablo ($_id INTEGER PRIMARY KEY AUTOINCREMENT, $_plakaadi TEXT, $_ver INTEGER )");
  }

  Future<int?> plakaekle(Plakalar plaka) async {
    var db = await _getDatabase();
    var sonuc =
        await db?.insert(_plakatablo, plaka.toMap(), nullColumnHack: "$_id");
    print("plaka db ye eklendi");
    return sonuc;
  }

  Future<List<Map<String, dynamic>?>?> tumplakalar() async {
    var db = await _getDatabase();
    var sonuc = await db?.query("$_plakatablo", orderBy: "$_id ASC");
    return sonuc;
  }

  Future<int?> plakaguncelle(Plakalar plakalar) async {
    var db = await _getDatabase();
    var sonuc = await db?.update("$_plakatablo", plakalar.toMap(),
        where: "$_id = ?", whereArgs: [plakalar.id]);
    return sonuc;
  }
}
