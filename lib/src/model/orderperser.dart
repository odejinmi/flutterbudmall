// To parse this JSON data, do
//
//     final ordersParse = ordersParseFromJson(jsonString);

import 'dart:convert';

List<OrdersParse> orderperserFromJson(String str) => List<OrdersParse>.from(
    json.decode(str).map((x) => OrdersParse.fromJson(x)));

String cartperserToJson(List<OrdersParse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrdersParse {
  OrdersParse({
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.paymentStatus,
    required this.deposit,
    required this.orderDetail,
    this.appliedCoupon,
  });

  int id;
  String orderNumber;
  int status;
  int paymentStatus;
  Deposit deposit;
  List<OrderDetail> orderDetail;
  dynamic appliedCoupon;

  factory OrdersParse.fromRawJson(String str) =>
      OrdersParse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrdersParse.fromJson(Map<String, dynamic> json) => OrdersParse(
        id: json["id"],
        orderNumber: json["order_number"],
        status: json["status"],
        paymentStatus: json["payment_status"],
        deposit: Deposit.fromJson(json["deposit"]),
        orderDetail: List<OrderDetail>.from(
            json["order_detail"].map((x) => OrderDetail.fromJson(x))),
        appliedCoupon: json["applied_coupon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_number": orderNumber,
        "status": status,
        "payment_status": paymentStatus,
        "deposit": deposit.toJson(),
        "order_detail": List<dynamic>.from(orderDetail.map((x) => x.toJson())),
        "applied_coupon": appliedCoupon,
      };
}

class Deposit {
  Deposit({
    required this.orderId,
  });

  int orderId;

  factory Deposit.fromRawJson(String str) => Deposit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Deposit.fromJson(Map<String, dynamic> json) => Deposit(
        orderId: json["order_id"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
      };
}

class OrderDetail {
  OrderDetail({
    required this.id,
    required this.sellerId,
    required this.orderId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.basePrice,
    required this.totalPrice,
    required this.details,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int sellerId;
  int orderId;
  int productId;
  String productName;
  int quantity;
  String basePrice;
  String totalPrice;
  String details;
  DateTime createdAt;
  DateTime updatedAt;

  factory OrderDetail.fromRawJson(String str) =>
      OrderDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        sellerId: json["seller_id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        productName: json["product_name"],
        quantity: json["quantity"],
        basePrice: json["base_price"],
        totalPrice: json["total_price"],
        details: json["details"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "seller_id": sellerId,
        "order_id": orderId,
        "product_id": productId,
        "product_name": productName,
        "quantity": quantity,
        "base_price": basePrice,
        "total_price": totalPrice,
        "details": details,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
