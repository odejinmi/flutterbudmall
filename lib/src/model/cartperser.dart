// To parse this JSON data, do
//
//     final cartperser = cartperserFromJson(jsonString);

import 'dart:convert';

List<Cartperser> cartperserFromJson(String str) =>
    List<Cartperser>.from(json.decode(str).map((x) => Cartperser.fromJson(x)));

String cartperserToJson(List<Cartperser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cartperser {
  Cartperser({
    this.id,
    this.userId,
    this.sessionId,
    this.productId,
    this.attributes,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  int? id;
  int? userId;
  String? sessionId;
  int? productId;
  dynamic attributes;
  int? quantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  Product? product;

  factory Cartperser.fromJson(Map<String, dynamic> json) => Cartperser(
        id: json["id"],
        userId: json["user_id"],
        sessionId: json["session_id"],
        productId: json["product_id"],
        attributes: json["attributes"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "session_id": sessionId,
        "product_id": productId,
        "attributes": attributes,
        "quantity": quantity,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "product": product!.toJson(),
      };
}

class Product {
  Product({
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
  dynamic negotiable;
  dynamic negotiateamount;
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
  dynamic sold;
  dynamic tier;
  dynamic oldamount;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  dynamic registeredby;
  String? sku;
  dynamic quantity;
  int? hotdeal;
  int? showInFrontend;
  dynamic specification;
  String? deliveryLocation;
  String? deliveryCategory;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
        negotiable: json["negotiable"],
        negotiateamount: json["negotiateamount"],
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
        oldamount: json["oldamount"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        registeredby: json["registeredby"],
        sku: json["sku"],
        quantity: json["quantity"],
        hotdeal: json["hotdeal"],
        showInFrontend: json["show_in_frontend"],
        specification: json["specification"],
        deliveryLocation: json["delivery_location"],
        deliveryCategory: json["delivery_category"],
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
        "negotiable": negotiable,
        "negotiateamount": negotiateamount,
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
        "oldamount": oldamount,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "registeredby": registeredby,
        "sku": sku,
        "quantity": quantity,
        "hotdeal": hotdeal,
        "show_in_frontend": showInFrontend,
        "specification": specification,
        "delivery_location": deliveryLocation,
        "delivery_category": deliveryCategory,
      };
}
