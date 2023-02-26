import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/post_model.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final nameDB = 'SOCIALDB';
  static final versionDB = 1;

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) 
      return _database!;

    return _database = await _initDataBase();
  }

  _initDataBase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path,nameDB);
    await openDatabase(
        pathDB,
        version: versionDB,
        onCreate: _createTables,
    );
  }

  _createTables(Database db, int version) async {
    String query = '''
      CREATE TABLE tblPost (
        idPost INTEGER PRIMARY KEY, 
        dscPost VARCHAR(200), 
        datePost DATE
      )''';

      db.execute(query);
  }

  Future<int> INSERT(String tblName, Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion.insert(tblName, data);
  }

  Future<int> UPDATE(String tblName, Map<String,dynamic> data) async {
    var conexion = await database;
    return conexion.update(tblName, data, where: 'idPost = ?', whereArgs: [data['idPost']]);
  }

  Future<int> DELETE (String tblName, int idPost) async {
    var conexion = await database;
    return conexion.delete(tblName, where: 'idPost = ?', whereArgs: [idPost]);
  }

  Future<List<PostModel>> GETALLPOST() async {
    var conexion = await database;
    var result = await conexion.query('tblPost');
    return result.map((post) => PostModel.fromMap(post)).toList();
  }

}
