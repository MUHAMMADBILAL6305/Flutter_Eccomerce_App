// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) =>
    json.encode(data.toJson(data.productId.toString()));

class ProductModel {
  ProductModel({
    this.categoryId,
    this.productName,
    this.productDescription,
    this.productPrice,
    this.productRating,
    this.productId,
    this.productImage,
  });

  String? categoryId,
      productName,
      productDescription,
      productPrice,
      productId,
      productImage;
  int? productRating;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    categoryId: json["categoryID"],
    productName: json["productName"],
    productDescription: json["productDescription"],
    productPrice: json["productPrice"],
    productRating: json["productRating"],
    productId: json["productID"],
    productImage: json["productImage"],
  );

  Map<String, dynamic> toJson(String docId) => {
    "categoryID": categoryId,
    "productName": productName,
    "productDescription": productDescription,
    "productPrice": productPrice,
    "productRating": productRating,
    "productID": docId,
    "productImage": productImage,
  };
}
