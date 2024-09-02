import 'dart:convert';

class ModelPesanan {
  final String? status;
  final String? message;
  final DataPesanan? data;

  ModelPesanan({
    this.status,
    this.message,
    this.data,
  });

  factory ModelPesanan.fromJson(String str) =>
      ModelPesanan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelPesanan.fromMap(Map<String, dynamic> json) => ModelPesanan(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : DataPesanan.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

class DataPesanan {
  final int? restaurantId;
  final int? shippingCost;
  final int? userId;
  final String? shippingAddress;
  final String? shippingLatlong;
  final String? status;
  final int? totalPrice;
  final int? totalBill;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  DataPesanan({
    this.restaurantId,
    this.shippingCost,
    this.userId,
    this.shippingAddress,
    this.shippingLatlong,
    this.status,
    this.totalPrice,
    this.totalBill,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory DataPesanan.fromJson(String str) =>
      DataPesanan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataPesanan.fromMap(Map<String, dynamic> json) => DataPesanan(
        restaurantId: json["restaurant_id"],
        shippingCost: json["shipping_cost"],
        userId: json["user_id"],
        shippingAddress: json["shipping_address"],
        shippingLatlong: json["shipping_latlong"],
        status: json["status"],
        totalPrice: json["total_price"],
        totalBill: json["total_bill"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "restaurant_id": restaurantId,
        "shipping_cost": shippingCost,
        "user_id": userId,
        "shipping_address": shippingAddress,
        "shipping_latlong": shippingLatlong,
        "status": status,
        "total_price": totalPrice,
        "total_bill": totalBill,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
