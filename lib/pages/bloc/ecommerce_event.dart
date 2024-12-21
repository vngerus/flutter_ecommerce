part of 'ecommerce_bloc.dart';

sealed class EcommerceEvent extends Equatable {
  const EcommerceEvent();

  @override
  List<Object> get props => [];
}

class LoadProductsEvent extends EcommerceEvent {}

class AddToCartEvent extends EcommerceEvent {
  final ProductModel product;

  const AddToCartEvent({required this.product});

  @override
  List<Object> get props => [product];
}

class UpdateCartQuantityEvent extends EcommerceEvent {}

class RemoveCartItemEvent extends EcommerceEvent {}
