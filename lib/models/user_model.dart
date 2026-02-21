enum UserRole { buyer, seller }

class UserModel {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final String? location;
  final UserRole role;
  
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    this.location,
    this.role = UserRole.buyer,
  });
}

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String sellerId;
  final String sellerName;
  final String category;
  final double rating;
  final int reviews;
  final bool isAvailable;
  
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.sellerId,
    required this.sellerName,
    required this.category,
    this.rating = 0.0,
    this.reviews = 0,
    this.isAvailable = true,
  });
}
