import 'dart:convert';
import 'package:flutter_application/Category_assignment/Database.dart';
import 'package:http/http.dart';

class Productdto {
  int? id;
  String? title;
  String? price;
  String? description;
  String? image;
  String? category;

  Productdto(
      {this.description,
      this.id,
      this.image,
      this.price,
      this.title,
      this.category});

  factory Productdto.fromjson(Map<String, dynamic> map) {
    return Productdto(
      id: map['id'],
      title: map['title'],
      price: map['price'].toString(),
      description: map['description'],
      image: map['image'],
      category: map['category'],
    );
  }
}

class ProductService {
  Future<List<Productdto>> getdata() async {
    String url = "https://fakestoreapi.com/products";
    Response _res = await get(Uri.parse(url));
    List<Productdto> productlist = (jsonDecode(_res.body) as List)
        .map((item) => Productdto.fromjson(item))
        .toList();

    AppDataBase().productData(productlist);

    return productlist;
  }
}
