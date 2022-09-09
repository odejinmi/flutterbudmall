// To parse this JSON data, do
//
//     final categoperser = categoperserFromJson(jsonString);

import 'dart:convert';

List<Categoperser> categoperserFromJson(String str) => List<Categoperser>.from(
    json.decode(str).map((x) => Categoperser.fromJson(x)));

String categoperserToJson(List<Categoperser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categoperser {
  Categoperser({
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
  int? parentId;
  int? subId;
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

  factory Categoperser.fromJson(Map<String, dynamic> json) => Categoperser(
        id: json["id"],
        parentId: json["parent_id"] == null ? null : json["parent_id"],
        subId: json["sub_id"] == null ? null : json["sub_id"],
        name: json["name"],
        icon: json["icon"],
        metaTitle: json["meta_title"] == null ? null : json["meta_title"],
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
        "parent_id": parentId == null ? null : parentId,
        "sub_id": subId == null ? null : subId,
        "name": name,
        "icon": icon,
        "meta_title": metaTitle == null ? null : metaTitle,
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
