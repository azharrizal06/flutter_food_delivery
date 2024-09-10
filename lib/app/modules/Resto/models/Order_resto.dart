import 'dart:convert';

class OrderResto {
  final String? status;
  final String? message;
  final List<OrderRestodata>? data;

  OrderResto({
    this.status,
    this.message,
    this.data,
  });

  factory OrderResto.fromJson(String str) =>
      OrderResto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderResto.fromMap(Map<String, dynamic> json) => OrderResto(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<OrderRestodata>.from(
                json["data"]!.map((x) => OrderRestodata.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class OrderRestodata {
  final int? id;
  final int? userId;
  final int? restaurantId;
  final dynamic driverId;
  final int? totalPrice;
  final int? shippingCost;
  final int? totalBill;
  final String? paymentMethod;
  final String? status;
  final String? shippingAddress;
  final String? shippingLatlong;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  OrderRestodata({
    this.id,
    this.userId,
    this.restaurantId,
    this.driverId,
    this.totalPrice,
    this.shippingCost,
    this.totalBill,
    this.paymentMethod,
    this.status,
    this.shippingAddress,
    this.shippingLatlong,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderRestodata.fromJson(String str) =>
      OrderRestodata.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderRestodata.fromMap(Map<String, dynamic> json) => OrderRestodata(
        id: json["id"],
        userId: json["user_id"],
        restaurantId: json["restaurant_id"],
        driverId: json["driver_id"],
        totalPrice: json["total_price"],
        shippingCost: json["shipping_cost"],
        totalBill: json["total_bill"],
        paymentMethod: json["payment_method"],
        status: json["status"],
        shippingAddress: json["shipping_address"],
        shippingLatlong: json["shipping_latlong"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "restaurant_id": restaurantId,
        "driver_id": driverId,
        "total_price": totalPrice,
        "shipping_cost": shippingCost,
        "total_bill": totalBill,
        "payment_method": paymentMethod,
        "status": status,
        "shipping_address": shippingAddress,
        "shipping_latlong": shippingLatlong,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
