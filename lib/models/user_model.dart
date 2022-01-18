// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.docId,
    this.email,
    this.contactNumber,
    this.name,
  });

  String? docId, email, contactNumber, name;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        docId: json["docId"],
        email: json["email"],
        contactNumber: json["contactNumber"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "email": email,
        "contactNumber": contactNumber,
        "name": name,
      };
}
