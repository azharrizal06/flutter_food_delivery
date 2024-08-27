import 'package:food_delivery/app/core/core.dart';

class Restoproduk {
  final int id;
  final String imageUrl;
  final String name;
  final String description;
  final int price;
  final int stock;
  final bool isAvailable;
  final bool isFavorite;
  final DateTime createdAt;
  final DateTime updatedAt;
  int quantity;

  Restoproduk({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.isAvailable,
    required this.isFavorite,
    required this.createdAt,
    required this.updatedAt,
    this.quantity = 1,
  });

  // Method untuk memformat harga
  String get priceFormatted => price.currencyFormatRp;

  // Factory method untuk membuat instance dari JSON
  factory Restoproduk.fromJson(Map<String, dynamic> json) {
    return Restoproduk(
      id: json['id'],
      imageUrl: json['image'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      stock: json['stock'],
      isAvailable: json['is_available'] == 1,
      isFavorite: json['is_favorite'] == 1,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method untuk mengonversi instance ke dalam format JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': imageUrl,
      'name': name,
      'description': description,
      'price': price,
      'stock': stock,
      'is_available': isAvailable ? 1 : 0,
      'is_favorite': isFavorite ? 1 : 0,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'quantity': quantity,
    };
  }
}
