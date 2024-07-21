import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../Ecommerce/productdto.dart';

class AppDataBase {
  String _dbname = "productinfo";
  Future createDbPath() async {
    final String _dbFilePath;
    Directory _dbpath = await getApplicationDocumentsDirectory();
    _dbFilePath = join(_dbpath.path, _dbname);
    return _dbFilePath;
  }

  Future getDbFile() async {
    final File _file = File(await createDbPath());
    return _file.path;
  }

  initializeDb() async {
    Database _db = await openDatabase(await getDbFile(), version: 3,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE productinfo(ProductId INTEGER, ProductTitle TEXT, ProductDescription TEXT, ProductPrice INTEGER)");
    }, onUpgrade: (Database db, int oldversion, int newversion) async {
      switch (oldversion) {
        case 1:
          await db.execute(
              "CREATE TABLE productinfo(ProductId INTEGER, ProductTitle TEXT, ProductDescription TEXT)");
          break;

        case 2:
          await db
              .execute("ALTER TABLE productinfo ADD COLUMN ProductPrice TEXT");
          break;
      }
    });
    return _db;
  }

  Future<Database> get _getDatabase async {
    Database _db = await initializeDb();
    return _db;
  }

  Future productData(List<Productdto> product) async{
    Database _dbClient = await _getDatabase;
    Batch _batch = _dbClient.batch();
    product.forEach((element){
      Map<String,dynamic> map = {
        "ProductId" : element.id,
        "ProductTitle" : element.title,
        "ProductDescription" : element.description,
      };
      _batch.insert('productinfo', map);
    });
    _batch.commit();
  }
}
