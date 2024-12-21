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
      );
    }).toList();

    emit(state.copyWith(
      homeScreenState: HomeScreenState.success,
      products: products,
    ));
  }

  void _onAddToCartEvent(AddToCartEvent event, Emitter<EcommerceState> emit) {
    final existingProductIndex =
        state.cart.indexWhere((p) => p.id == event.product.id);

    final updatedCart = List<ProductModel>.from(state.cart);

    if (existingProductIndex != -1) {
      final existingProduct = updatedCart[existingProductIndex];
      updatedCart[existingProductIndex] =
          existingProduct.copyWith(quantity: existingProduct.quantity + 1);
    } else {
      updatedCart.add(event.product.copyWith(quantity: 1));
    }

    emit(state.copyWith(cart: updatedCart));
  }

  void _onUpdateCartQuantityEvent(
      UpdateCartQuantityEvent event, Emitter<EcommerceState> emit) {}

  void _onRemoveCartItemEvent(
      RemoveCartItemEvent event, Emitter<EcommerceState> emit) {}
}
