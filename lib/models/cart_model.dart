// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

import 'package:eccomerce_app_practice/models/product_model.dart';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.userId,
    this.totalBill,
    this.product,
  });

  String? userId, totalBill;
  List<ProductModel>? product;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        userId: json["userId"],
        totalBill: json["totalBill"],
        product: List<ProductModel>.from(
            json["product"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "totalBill": totalBill,
        "product": List<dynamic>.from(
            product!.map((x) => x.toJson(x.productId.toString()))),
      };
}
