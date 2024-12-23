import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/data.dart';
import 'package:flutter_ecommerce_app/model/product_model.dart';

part 'ecommerce_event.dart';
part 'ecommerce_state.dart';

class EcommerceBloc extends Bloc<EcommerceEvent, EcommerceState> {
  EcommerceBloc() : super(EcommerceState.initial()) {
    on<LoadProductsEvent>(_onLoadProductsEvent);
    on<AddToCartEvent>(_onAddToCartEvent);
    on<UpdateCartQuantityEvent>(_onUpdateCartQuantityEvent);
    on<RemoveCartItemEvent>(_onRemoveCartItemEvent);
    on<SelectCategoryEvent>(_onSelectCategoryEvent);
  }

  void _onLoadProductsEvent(
      LoadProductsEvent event, Emitter<EcommerceState> emit) async {
    emit(state.copyWith(homeScreenState: HomeScreenState.loading));

    await Future.delayed(const Duration(milliseconds: 200));

    final products = productJson.map((json) {
      return ProductModel(
        id: json["id"].toString(),
        name: json["description"],
        price: double.parse(json["price"].toString()),
        imageUrl: json["image_url"],
        category: json["product"],
      );
    }).toList();

    emit(state.copyWith(
      homeScreenState: HomeScreenState.success,
      products: products,
    ));
  }

  void _onAddToCartEvent(AddToCartEvent event, Emitter<EcommerceState> emit) {
    final exist = state.cart.firstWhere(
      (p) => p.id == event.product.id,
      orElse: () => event.product.copyWith(quantity: 0),
    );

    final updatedCart = state.cart.map((p) {
      if (p.id == event.product.id) {
        return p.copyWith(quantity: p.quantity + 1);
      }
      return p;
    }).toList();

    if (exist.quantity == 0) {
      updatedCart.add(event.product.copyWith(quantity: 1));
    }

    final newTotal = updatedCart.fold<double>(
      0.0,
      (sum, product) => sum + (product.price * product.quantity),
    );

    emit(state.copyWith(cart: updatedCart, totalPrice: newTotal));
  }

  void _onUpdateCartQuantityEvent(
      UpdateCartQuantityEvent event, Emitter<EcommerceState> emit) {
    final updatedCart = state.cart.map((p) {
      if (p.id == event.product.id) {
        final newQuantity = event.isIncrement ? p.quantity + 1 : p.quantity - 1;
        return p.copyWith(quantity: newQuantity > 0 ? newQuantity : 1);
      }
      return p;
    }).toList();

    final newTotal = updatedCart.fold<double>(
      0.0,
      (sum, product) => sum + (product.price * product.quantity),
    );

    emit(state.copyWith(cart: updatedCart, totalPrice: newTotal));
  }

  void _onRemoveCartItemEvent(
      RemoveCartItemEvent event, Emitter<EcommerceState> emit) {
    final updatedCart =
        state.cart.where((p) => p.id != event.product.id).toList();

    final newTotal = updatedCart.fold<double>(
      0.0,
      (sum, product) => sum + (product.price * product.quantity),
    );

    emit(state.copyWith(cart: updatedCart, totalPrice: newTotal));
  }

  void _onSelectCategoryEvent(
      SelectCategoryEvent event, Emitter<EcommerceState> emit) {
    final selectedCategory = event.category;

    final filteredProducts = selectedCategory == null
        ? productJson
            .map((json) => ProductModel(
                  id: json["id"].toString(),
                  name: json["description"],
                  price: double.parse(json["price"].toString()),
                  imageUrl: json["image_url"],
                  category: json["product"],
                ))
            .toList()
        : state.products
            .where((product) => product.category == selectedCategory)
            .toList();

    emit(state.copyWith(
      selectedCategory: selectedCategory,
      products: filteredProducts,
    ));
  }
}
