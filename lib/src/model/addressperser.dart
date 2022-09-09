// To parse this JSON data, do
//
//     final addressperser = addressperserFromJson(jsonString);

import 'dart:convert';

List<Addressperser> addressperserFromJson(String str) =>
    List<Addressperser>.from(
        json.decode(str).map((x) => Addressperser.fromJson(x)));

String addressperserToJson(List<Addressperser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Addressperser {
  Addressperser({
    this.id,
    this.userId,
    this.country,
    this.address,
    this.name,
    this.phoneNumber,
    this.defaulty,
    this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  int? userId;
  String? country;
  String? address;
  String? name;
  String? phoneNumber;
  int? defaulty;
  int? status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Addressperser.fromJson(Map<String, dynamic> json) => Addressperser(
        id: json["id"],
        userId: json["user_id"],
        country: json["country"],
        address: json["address"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        defaulty: json["default"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "country": country,
        "address": address,
        "name": name,
        "phone_number": phoneNumber,
        "default": defaulty,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
