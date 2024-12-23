import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/pages/bloc/ecommerce_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EcommerceBloc, EcommerceState>(
      builder: (context, state) {
        if (state.cart.isEmpty) {
          return const Center(
            child: Text(
              "Your cart is empty",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          );
        }

        return ListView.builder(
          itemCount: state.cart.length,
          itemBuilder: (context, i) {
            final product = state.cart[i];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<EcommerceBloc>().add(
                            RemoveCartItemEvent(product: product),
                          );
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.broken_image,
                          size: 40,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "\$${(product.price * product.quantity).toStringAsFixed(3)}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<EcommerceBloc>().add(
                                UpdateCartQuantityEvent(
                                  product: product,
                                  isIncrement: false,
                                ),
                              );
                        },
                        icon: const Icon(Icons.remove_circle_outline,
                            color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        product.quantity.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {
                          context.read<EcommerceBloc>().add(
                                UpdateCartQuantityEvent(
                                  product: product,
                                  isIncrement: true,
                                ),
                              );
                        },
                        icon: const Icon(Icons.add_circle_outline,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
