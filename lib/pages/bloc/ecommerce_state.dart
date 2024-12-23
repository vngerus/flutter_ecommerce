part of 'ecommerce_bloc.dart';

enum HomeScreenState {
  none,
  loading,
  success,
  failure,
}

class EcommerceState extends Equatable {
  final List<ProductModel> products;
  final List<ProductModel> cart;
  final HomeScreenState homeScreenState;
  final double totalPrice;
  final String? selectedCategory;

  const EcommerceState({
    required this.products,
    required this.cart,
    required this.homeScreenState,
    required this.totalPrice,
    this.selectedCategory,
  });

  factory EcommerceState.initial() {
    return const EcommerceState(
      products: [],
      cart: [],
      homeScreenState: HomeScreenState.none,
      totalPrice: 0.0,
      selectedCategory: null,
    );
  }

  EcommerceState copyWith({
    List<ProductModel>? products,
    List<ProductModel>? cart,
    HomeScreenState? homeScreenState,
    double? totalPrice,
    String? selectedCategory,
  }) {
    return EcommerceState(
      products: products ?? this.products,
      cart: cart ?? this.cart,
      homeScreenState: homeScreenState ?? this.homeScreenState,
      totalPrice: totalPrice ?? this.totalPrice,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props =>
      [products, cart, homeScreenState, totalPrice, selectedCategory];
}
