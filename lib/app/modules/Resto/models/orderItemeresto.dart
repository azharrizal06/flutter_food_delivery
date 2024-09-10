import 'dart:convert';

class OrderItemResto {
  final String? status;
  final String? message;
  final List<DataOrderItem>? data;

  OrderItemResto({
    this.status,
    this.message,
    this.data,
  });

  factory OrderItemResto.fromJson(String str) =>
      OrderItemResto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItemResto.fromMap(Map<String, dynamic> json) => OrderItemResto(
        status: json["Status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DataOrderItem>.from(
                json["data"]!.map((x) => DataOrderItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class DataOrderItem {
  final int? id;
  final String? name;
  final String? description;
  final int? price;
  final int? stock;
  final int? isAvailable;
  final int? isFavorite;
  final String? image;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DataOrderItem({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stock,
    this.isAvailable,
    this.isFavorite,
    this.image,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory DataOrderItem.fromJson(String str) =>
      DataOrderItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataOrderItem.fromMap(Map<String, dynamic> json) => DataOrderItem(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        isAvailable: json["is_available"],
        isFavorite: json["is_favorite"],
        image: json["image"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stock": stock,
        "is_available": isAvailable,
        "is_favorite": isFavorite,
        "image": image,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
