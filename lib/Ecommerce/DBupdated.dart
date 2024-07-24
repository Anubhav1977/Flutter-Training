import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'productdto.dart';

class AppDataBase {
  String _dbname = "Product_DB";

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
    Database _db = await openDatabase(await getDbFile(), version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE Productinfo( ProductId INTEGER, ProductTitle TEXT,ProductPrice TEXT,ProductDescription TEXT,ProductImage TEXT,ProductCategory TEXT,ProductRatingRate TEXT,ProductRatingCount INTEGER)");
    });
    return _db;
  }

  Future<Database> get getDatabase async {
    Database _db = await initializeDb();
    return _db;
  }

  Future productData(List<Productdto> product) async {
    Database _dbClient = await getDatabase;
    Batch _batch = _dbClient.batch();

    product.forEach((element) {
      Map<String, dynamic> map = {
        "ProductId": element.id,
        "ProductTitle": element.title,
        "ProductDescription": element.description,
        "ProductPrice": element.price,
        "ProductImage": element.image,
        "ProductCategory": element.category,
        "ProductRatingRate": element.rating!.rate,
        "ProductRatingCount": element.rating!.count,
      };
      _batch.insert('Productinfo', map);
    });
    _batch.commit();
  }

  Future<List<Productdto>> getProducts() async {
    Database _db = await getDatabase;
    List<Map<String, dynamic>> dbData =
        await _db.rawQuery("SELECT * FROM Productinfo");
    List<Productdto> productList =
        dbData.map((item) => Productdto.fromdb(item)).toList();
    return productList;
  }
}
