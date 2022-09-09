// To parse this JSON data, do
//
//     final productDetailsParse = productDetailsParseFromJson(jsonString);

import 'dart:convert';

ProductDetailsParse productDetailsParseFromJson(String str) =>
    ProductDetailsParse.fromJson(json.decode(str));

String productDetailsParseToJson(ProductDetailsParse data) =>
    json.encode(data.toJson());

class ProductDetailsParse {
  ProductDetailsParse({
    required this.product,
    required this.reviewAvailable,
    required this.relatedProducts,
    required this.discount,
    required this.attributes_,
    required this.images,
    required this.seoContents,
  });

  Product product;
  bool reviewAvailable;
  List<Product> relatedProducts;
  int discount;
  List<dynamic> attributes_;
  List<dynamic> images;
  SeoContents seoContents;

  factory ProductDetailsParse.fromRawJson(String str) =>
      ProductDetailsParse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductDetailsParse.fromJson(Map<String, dynamic> json) =>
      ProductDetailsParse(
        product: Product.fromJson(json["product"]),
        reviewAvailable: json["review_available"],
        relatedProducts: List<Product>.from(
            json["related_products"].map((x) => Product.fromJson(x))),
        discount: json["discount"],
        attributes_: List<dynamic>.from(json["attributes"].map((x) => x)),
        images: List<dynamic>.from(json["images"].map((x) => x)),
        seoContents: SeoContents.fromJson(json["seoContents"]),
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "review_available": reviewAvailable,
        "related_products":
            List<dynamic>.from(relatedProducts.map((x) => x.toJson())),
        "discount": discount,
        "attributes": List<dynamic>.from(attributes_.map((x) => x)),
        "images": List<dynamic>.from(images.map((x) => x)),
        "seoContents": seoContents.toJson(),
      };
}

class Product {
  Product({
    required this.id,
    required this.sellerId,
    required this.brandId,
    required this.name,
    this.model,
    required this.hasVariants,
    required this.trackInventory,
    required this.basePrice,
    required this.category,
    required this.subcategory,
    required this.negotiateamount,
    required this.mainImage,
    this.videoLink,
    required this.description,
    this.summary,
    required this.isFeatured,
    required this.inStock,
    this.extraDescriptions,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.sold,
    this.tier,
    required this.oldamount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.sku,
    required this.quantity,
    required this.hotdeal,
    required this.showInFrontend,
    this.specification,
    required this.deliveryLocation,
  });

  int id;
  int sellerId;
  int brandId;
  String name;
  dynamic model;
  int hasVariants;
  int trackInventory;
  String basePrice;
  String category;
  String subcategory;
  String negotiateamount;
  String mainImage;
  dynamic videoLink;
  String description;
  dynamic summary;
  int isFeatured;
  String inStock;
  dynamic extraDescriptions;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaKeywords;
  dynamic sold;
  dynamic tier;
  String oldamount;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String sku;
  int quantity;
  int hotdeal;
  int showInFrontend;
  dynamic specification;
  String deliveryLocation;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json["id"],
      sellerId: json["seller_id"],
      brandId: json["brand_id"],
      name: json["name"],
      model: json["model"],
      hasVariants: json["has_variants"],
      trackInventory: json["track_inventory"],
      basePrice: json["base_price"],
      category: json["category"] ?? "",
      subcategory: json["subcategory"] ?? "",
      negotiateamount: json["negotiateamount"] ?? "",
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
      oldamount: json["oldamount"] ?? "",
      status: json["status"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      deletedAt: json["deleted_at"],
      sku: json["sku"],
      quantity: json["quantity"] ?? 0,
      hotdeal: json["hotdeal"],
      showInFrontend: json["show_in_frontend"],
      specification: json["specification"],
      deliveryLocation: json["delivery_location"]);

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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "sku": sku,
        "quantity": quantity,
        "hotdeal": hotdeal,
        "show_in_frontend": showInFrontend,
        "specification": specification,
        "delivery_location": deliveryLocation,
      };
}

class Pivot {
  Pivot({
    required this.categoryId,
    required this.productId,
  });

  int categoryId;
  int productId;

  factory Pivot.fromRawJson(String str) => Pivot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        categoryId: json["category_id"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "product_id": productId,
      };
}

class SeoContents {
  SeoContents({
    required this.keywords,
    required this.description,
    required this.socialTitle,
    required this.socialDescription,
    required this.image,
    required this.imageSize,
  });

  List<dynamic> keywords;
  String description;
  String socialTitle;
  String socialDescription;
  String image;
  String imageSize;

  factory SeoContents.fromRawJson(String str) =>
      SeoContents.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SeoContents.fromJson(Map<String, dynamic> json) => SeoContents(
        keywords: List<dynamic>.from(json["keywords"].map((x) => x)),
        description: json["description"],
        socialTitle: json["social_title"],
        socialDescription: json["social_description"],
        image: json["image"],
        imageSize: json["image_size"],
      );

  Map<String, dynamic> toJson() => {
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
        "description": description,
        "social_title": socialTitle,
        "social_description": socialDescription,
        "image": image,
        "image_size": imageSize,
      };
}
