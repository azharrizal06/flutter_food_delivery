import '../../../core/core.dart';

class ProductModel {
  final String imageUrl;
  final String name;
  final String description;
  final int price;
  final DateTime createdAt;
  int quantity;

  ProductModel({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.createdAt,
    this.quantity = 0,
  });

  String get priceFormatted => price.currencyFormatRp;
}
