import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/model/product_model.dart';
import 'package:flutter_ecommerce_app/pages/bloc/ecommerce_bloc.dart';
import 'package:flutter_ecommerce_app/widgets/app_colors.dart';
import 'package:flutter_ecommerce_app/widgets/app_primary_button.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: BlocBuilder<EcommerceBloc, EcommerceState>(
        builder: (context, state) {
          if (state.homeScreenState == HomeScreenState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.products.isEmpty) {
            return const Center(child: Text("No products available"));
          }

          return Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  itemCount: state.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: .65,
                  ),
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return _buildCardProduct(
                      context: context,
                      product: product,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCardProduct({
    required BuildContext context,
    required ProductModel product,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          height: 120,
          decoration: BoxDecoration(
            color: AppColor.greyBackground,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.broken_image,
                size: 50,
                color: AppColor.greyLight,
              );
            },
          ),
        ),
        const SizedBox(height: 4),
        Text(
          product.name,
          style: TextStyle(
            color: AppColor.black,
            fontSize: 12,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 7),
        Text(
          "\$${product.price.toStringAsFixed(2)}",
          style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppPrimaryButton(
          onTap: () {
            context.read<EcommerceBloc>().add(AddToCartEvent(product: product));
          },
          text: "Add to cart",
          fontSize: 12,
          height: 30,
        ),
      ],
    );
  }
}
