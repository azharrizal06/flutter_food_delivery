import '../../../core/core.dart';

class OrderListModel {
  final String imageUrl;
  final String restoName;
  final String customerName;
  final String deliveryAddress;
  final int price;
  final DateTime createdAt;

  OrderListModel({
    required this.imageUrl,
    required this.restoName,
    required this.customerName,
    required this.deliveryAddress,
    required this.price,
    required this.createdAt,
  });

  String get priceFormatted => price.currencyFormatRp;
}
