import '../../../core/assets/assets.dart';

class TrackRecordModel {
  final String label;
  final String title;
  final String? address;
  final bool isDelivery;
  final DateTime updatedAt;

  TrackRecordModel({
    required this.label,
    required this.title,
    this.address,
    required this.isDelivery,
    required this.updatedAt,
  });

  String get imagePath {
    if (isDelivery) return Assets.icons.statusDelivery.path;
    return Assets.icons.statusResto.path;
  }
}
