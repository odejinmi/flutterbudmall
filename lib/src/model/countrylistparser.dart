import 'dart:convert';

List<Countrylistparser> countrylistparserFromJson(String str) =>
    List<Countrylistparser>.from(
        json.decode(str).map((x) => Countrylistparser.fromJson(x)));

String countrylistparserToJson(List<Countrylistparser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Countrylistparser {
  Countrylistparser({
    this.id,
    this.isoName,
    this.name,
    this.currencyCode,
    this.currencyName,
    this.flag,
    this.callingCodes,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? isoName;
  String? name;
  String? currencyCode;
  String? currencyName;
  String? flag;
  String? callingCodes;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Countrylistparser.fromJson(Map<String, dynamic> json) =>
      Countrylistparser(
        id: json["id"],
        isoName: json["isoName"],
        name: json["name"],
        currencyCode: json["currencyCode"],
        currencyName: json["currencyName"],
        flag: json["flag"],
        callingCodes: json["callingCodes"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isoName": isoName,
        "name": name,
        "currencyCode": currencyCode,
        "currencyName": currencyName,
        "flag": flag,
        "callingCodes": callingCodes,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
