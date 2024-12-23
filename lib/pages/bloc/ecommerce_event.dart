part of 'ecommerce_bloc.dart';

sealed class EcommerceEvent extends Equatable {
  const EcommerceEvent();

  @override
  List<Object?> get props => [];
}

class LoadProductsEvent extends EcommerceEvent {}

class AddToCartEvent extends EcommerceEvent {
  final ProductModel product;

  const AddToCartEvent({required this.product});

  @override
  List<Object> get props => [product];
}

class UpdateCartQuantityEvent extends EcommerceEvent {
  final ProductModel product;
  final bool isIncrement;

  const UpdateCartQuantityEvent({
    required this.product,
    required this.isIncrement,
  });

  @override
  List<Object> get props => [product, isIncrement];
}

class RemoveCartItemEvent extends EcommerceEvent {
  final ProductModel product;

  const RemoveCartItemEvent({required this.product});

  @override
  List<Object> get props => [product];
}

class SelectCategoryEvent extends EcommerceEvent {
  final String? category;

  const SelectCategoryEvent({this.category});

  @override
  List<Object?> get props => [category];
}
