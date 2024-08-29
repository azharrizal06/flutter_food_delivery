class ResponAllresto {
  final String status;
  final String message;
  final List<DataResto> data;

  ResponAllresto(
      {required this.status, required this.message, required this.data});

  factory ResponAllresto.fromJson(Map<String, dynamic> json) {
    return ResponAllresto(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((item) => DataResto.fromJson(item))
          .toList(),
    );
  }
}

class DataResto {
  final int id;
  final String name;
  final String email;
  final DateTime? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String phone;
  final String? address;
  final String roles;
  final String? licensePlate;
  final String restaurantName;
  final String restaurantAddress;
  final String photo;
  final String latlong;

  DataResto({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.phone,
    this.address,
    required this.roles,
    this.licensePlate,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.photo,
    required this.latlong,
  });

  factory DataResto.fromJson(Map<String, dynamic> json) {
    return DataResto(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      phone: json['phone'] as String,
      address: json['address'] as String?,
      roles: json['roles'] as String,
      licensePlate: json['license_plate'] as String?,
      restaurantName: json['restaurant_name'] as String,
      restaurantAddress: json['restaurant_address'] as String,
      photo: json['photo'] as String,
      latlong: json['latlong'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'phone': phone,
      'address': address,
      'roles': roles,
      'license_plate': licensePlate,
      'restaurant_name': restaurantName,
      'restaurant_address': restaurantAddress,
      'photo': photo,
      'latlong': latlong,
    };
  }
}
