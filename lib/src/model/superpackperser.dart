// To parse this JSON data, do
//
//     final superpackperser = superpackperserFromJson(jsonString);

import 'dart:convert';

List<Superpackperser> superpackperserFromJson(String str) =>
    List<Superpackperser>.from(
        json.decode(str).map((x) => Superpackperser.fromJson(x)));

String superpackperserToJson(List<Superpackperser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Superpackperser {
  Superpackperser({
    this.id,
    this.parentId,
    this.subId,
    this.name,
    this.icon,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.image,
    this.isTop,
    this.isSpecial,
    this.inFilterMenu,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  dynamic parentId;
  dynamic subId;
  String? name;
  String? icon;
  String? metaTitle;
  dynamic metaDescription;
  dynamic metaKeywords;
  String? image;
  int? isTop;
  int? isSpecial;
  int? inFilterMenu;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory Superpackperser.fromJson(Map<String, dynamic> json) =>
      Superpackperser(
        id: json["id"],
        parentId: json["parent_id"],
        subId: json["sub_id"],
        name: json["name"],
        icon: json["icon"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
        image: json["image"],
        isTop: json["is_top"],
        isSpecial: json["is_special"],
        inFilterMenu: json["in_filter_menu"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "sub_id": subId,
        "name": name,
        "icon": icon,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
        "image": image,
        "is_top": isTop,
        "is_special": isSpecial,
        "in_filter_menu": inFilterMenu,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
