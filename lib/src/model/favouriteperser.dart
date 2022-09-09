// To parse this JSON data, do
//
//     final favouriteperser = favouriteperserFromJson(jsonString);

import 'dart:convert';

List<Favouriteperser> favouriteperserFromJson(String str) =>
    List<Favouriteperser>.from(
        json.decode(str).map((x) => Favouriteperser.fromJson(x)));

String favouriteperserToJson(List<Favouriteperser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Favouriteperser {
  Favouriteperser({
    this.id,
    this.userId,
    this.sessionId,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  int? id;
  int? userId;
  String? sessionId;
  int? productId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Product? product;

  factory Favouriteperser.fromJson(Map<String, dynamic> json) =>
      Favouriteperser(
        id: json["id"],
        userId: json["user_id"],
        sessionId: json["session_id"],
        productId: json["product_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "session_id": sessionId,
        "product_id": productId,
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
    this.stocks,
    this.categories,
    this.offer,
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
  List<dynamic>? stocks;
  List<Category>? categories;
  dynamic offer;

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
        stocks: List<dynamic>.from(json["stocks"].map((x) => x)),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        offer: json["offer"],
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
        "stocks": List<dynamic>.from(stocks!.map((x) => x)),
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "offer": offer,
      };
}

class Category {
  Category({
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
    this.pivot,
  });

  int? id;
  int? parentId;
  int? subId;
  String? name;
  String? icon;
  dynamic metaTitle;
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
  Pivot? pivot;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
        pivot: Pivot.fromJson(json["pivot"]),
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
        "pivot": pivot!.toJson(),
      };
}

class Pivot {
  Pivot({
    this.productId,
    this.categoryId,
  });

  int? productId;
  int? categoryId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        productId: json["product_id"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "category_id": categoryId,
      };
}
