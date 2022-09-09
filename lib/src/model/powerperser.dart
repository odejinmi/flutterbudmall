// To parse this JSON data, do
//
//     final powerperser = powerperserFromJson(jsonString);

import 'dart:convert';

List<Powerperser> powerperserFromJson(String str) => List<Powerperser>.from(
    json.decode(str).map((x) => Powerperser.fromJson(x)));

String powerperserToJson(List<Powerperser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Powerperser {
  Powerperser({
    this.id,
    this.name,
    this.symbol,
    this.image,
    this.code,
    this.billercode,
    this.type,
    this.status,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  String? name;
  String? symbol;
  String? image;
  String? code;
  String? billercode;
  String? type;
  int? status;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Powerperser.fromJson(Map<String, dynamic> json) => Powerperser(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        image: json["image"],
        code: json["code"],
        billercode: json["billercode"],
        type: json["type"] == null ? null : json["type"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "image": image,
        "code": code,
        "billercode": billercode,
        "type": type == null ? null : type,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
