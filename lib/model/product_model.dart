import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final int quantity;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.quantity = 1,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    double? price,
    String? imageUrl,
    String? category,
    int? quantity,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object> get props => [id, name, price, imageUrl, category, quantity];
}
