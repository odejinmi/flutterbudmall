// To parse this JSON data, do
//
//     final buydataperser = buydataperserFromJson(jsonString);

import 'dart:convert';

List<Buydataperser> buydataperserFromJson(String str) =>
    List<Buydataperser>.from(
        json.decode(str).map((x) => Buydataperser.fromJson(x)));

String buydataperserToJson(List<Buydataperser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Buydataperser {
  Buydataperser({
    this.id,
    this.name,
    this.network,
    this.networkcode,
    this.code,
    this.plan,
    this.cost,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  int? id;
  String? name;
  String? network;
  String? networkcode;
  String? code;
  String? plan;
  String? cost;
  String? status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic image;

  factory Buydataperser.fromJson(Map<String, dynamic> json) => Buydataperser(
        id: json["id"],
        name: json["name"],
        network: json["network"],
        networkcode: json["networkcode"],
        code: json["code"],
        plan: json["plan"],
        cost: json["cost"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "network": networkValues.reverse[network],
        "networkcode": networkcodeValues.reverse[networkcode],
        "code": codeValues.reverse[code],
        "plan": plan,
        "cost": cost,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "image": image,
      };
}

enum Code { MTN_DATA, GLO_DATA, ETISALAT_DATA, AIRTEL_DATA, SMILE_DIRECT }

final codeValues = EnumValues({
  "airtel-data": Code.AIRTEL_DATA,
  "etisalat-data": Code.ETISALAT_DATA,
  "glo-data": Code.GLO_DATA,
  "mtn-data": Code.MTN_DATA,
  "smile-direct": Code.SMILE_DIRECT
});

enum Network { MTN, GLOBACOM, THE_9_MOBILE, AIRTEL, SMILE }

final networkValues = EnumValues({
  "Airtel": Network.AIRTEL,
  "Globacom": Network.GLOBACOM,
  "MTN": Network.MTN,
  "Smile": Network.SMILE,
  "9mobile": Network.THE_9_MOBILE
});

enum Networkcode { MTN, GLO, THE_9_MOBILE, AIRTEL, SMILE }

final networkcodeValues = EnumValues({
  "airtel": Networkcode.AIRTEL,
  "glo": Networkcode.GLO,
  "mtn": Networkcode.MTN,
  "smile": Networkcode.SMILE,
  "9mobile": Networkcode.THE_9_MOBILE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
