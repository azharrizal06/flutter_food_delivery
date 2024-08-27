class UserModel {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final String phone;
  final String address;
  final String roles;
  final String? licensePlate;
  final String? restaurantName;
  final String? restaurantAddress;
  final String? photo;
  final String latlong;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.phone,
    required this.address,
    required this.roles,
    this.licensePlate,
    this.restaurantName,
    this.restaurantAddress,
    this.photo,
    required this.latlong,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      phone: json['phone'],
      address: json['address'],
      roles: json['roles'],
      licensePlate: json['license_plate'],
      restaurantName: json['restaurant_name'],
      restaurantAddress: json['restaurant_address'],
      photo: json['photo'],
      latlong: json['latlong'],
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      emailVerifiedAt: map['email_verified_at'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      phone: map['phone'],
      address: map['address'],
      roles: map['roles'],
      licensePlate: map['license_plate'],
      restaurantName: map['restaurant_name'],
      restaurantAddress: map['restaurant_address'],
      photo: map['photo'],
      latlong: map['latlong'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
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
