import '../../../core/core.dart';

class OrderModel {
  final String imageUrl;
  final String name;
  final String description;
  final int price;
  final String status;
  int quantity;

  OrderModel({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.status,
    this.quantity = 1,
  });

  String get priceFormatted => price.currencyFormatRp;
}
