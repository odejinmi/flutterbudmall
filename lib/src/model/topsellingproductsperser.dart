// To parse this JSON data, do
//
//     final topsellingproductsperser = topsellingproductsperserFromJson(jsonString);

import 'dart:convert';

List<Topsellingproductsperser> topsellingproductsperserFromJson(String str) =>
    List<Topsellingproductsperser>.from(
        json.decode(str).map((x) => Topsellingproductsperser.fromJson(x)));

String topsellingproductsperserToJson(List<Topsellingproductsperser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Topsellingproductsperser {
  Topsellingproductsperser({
    this.id,
    this.sellerId,
    this.brandId,
    this.name,
    this.model,
    this.hasVariants,
    this.trackInventory,
    this.basePrice,
    this.category,
    this.subcategory,
    this.negotiable,
    this.negotiateamount,
    this.mainImage,
    this.videoLink,
    this.description,
    this.summary,
    this.isFeatured,
    this.inStock,
    this.extraDescriptions,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.sold,
    this.tier,
    this.oldamount,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.registeredby,
    this.sku,
    this.quantity,
    this.hotdeal,
    this.showInFrontend,
    this.specification,
    this.deliveryLocation,
    this.deliveryCategory,
    this.total,
    this.reviews,
  });

  int? id;
  int? sellerId;
  int? brandId;
  String? name;
  dynamic model;
  int? hasVariants;
  int? trackInventory;
  String? basePrice;
  String? category;
  String? subcategory;
  String? negotiable;
  String? negotiateamount;
  String? mainImage;
  dynamic videoLink;
  String? description;
  dynamic summary;
  int? isFeatured;
  String? inStock;
  dynamic extraDescriptions;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaKeywords;
  int? sold;
  dynamic tier;
  String? oldamount;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? registeredby;
  String? sku;
  int? quantity;
  int? hotdeal;
  int? showInFrontend;
  dynamic specification;
  String? deliveryLocation;
  String? deliveryCategory;
  String? total;
  List<dynamic>? reviews;

  factory Topsellingproductsperser.fromJson(Map<String, dynamic> json) =>
      Topsellingproductsperser(
        id: json["id"],
        sellerId: json["seller_id"],
        brandId: json["brand_id"],
        name: json["name"],
        model: json["model"],
        hasVariants: json["has_variants"],
        trackInventory: json["track_inventory"],
        basePrice: json["base_price"],
        category: json["category"],
        subcategory: json["subcategory"],
        negotiable: json["negotiable"] == null ? null : json["negotiable"],
        negotiateamount:
            json["negotiateamount"] == null ? null : json["negotiateamount"],
        mainImage: json["main_image"],
        videoLink: json["video_link"],
        description: json["description"],
        summary: json["summary"],
        isFeatured: json["is_featured"],
        inStock: json["in_stock"],
        extraDescriptions: json["extra_descriptions"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
        sold: json["sold"],
        tier: json["tier"],
        oldamount: json["oldamount"] == null ? null : json["oldamount"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        registeredby:
            json["registeredby"] == null ? null : json["registeredby"],
        sku: json["sku"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        hotdeal: json["hotdeal"],
        showInFrontend: json["show_in_frontend"],
        specification: json["specification"],
        deliveryLocation: json["delivery_location"],
        deliveryCategory: json["delivery_category"],
        total: json["total"],
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "seller_id": sellerId,
        "brand_id": brandId,
        "name": name,
        "model": model,
        "has_variants": hasVariants,
        "track_inventory": trackInventory,
        "base_price": basePrice,
        "category": category,
        "subcategory": subcategory,
        "negotiable": negotiable == null ? null : negotiable,
        "negotiateamount": negotiateamount == null ? null : negotiateamount,
        "main_image": mainImage,
        "video_link": videoLink,
        "description": description,
        "summary": summary,
        "is_featured": isFeatured,
        "in_stock": inStock,
        "extra_descriptions": extraDescriptions,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
        "sold": sold,
        "tier": tier,
        "oldamount": oldamount == null ? null : oldamount,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "registeredby": registeredby == null ? null : registeredby,
        "sku": sku,
        "quantity": quantity == null ? null : quantity,
        "hotdeal": hotdeal,
        "show_in_frontend": showInFrontend,
        "specification": specification,
        "delivery_location": deliveryLocation,
        "delivery_category": deliveryCategory,
        "total": total,
        "reviews": List<dynamic>.from(reviews!.map((x) => x)),
      };
}
