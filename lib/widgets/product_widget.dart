import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/data.dart';
import 'package:flutter_ecommerce_app/widgets/app_colors.dart';
import 'package:flutter_ecommerce_app/widgets/app_primary_button.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: GridView.builder(
        itemCount: productJson.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: .8,
        ),
        itemBuilder: (context, i) {
          final product = productJson[i];
          return _buildCardProduct(
            title: product["description"],
            imageUrl: product["image_url"],
            price: product["price"].toString(),
            productID: product["id"].toString(),
          );
        },
      ),
    );
  }

  _buildCardProduct(
      {required String title,
      required String price,
      required String productID,
      required String imageUrl}) {
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
          child: Image.network(imageUrl),
        ),
        const SizedBox(height: 4),
        Text(
          "Apple iPhone 15 Pro 128GB Natural Titanium",
          style: TextStyle(
            color: AppColor.black,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          "\$699.0",
          style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppPrimaryButton(
          onTap: () {
            // Block (evento -> productID)
          },
          text: "Add to cart",
          fontSize: 12,
          height: 30,
        ),
      ],
    );
  }
}
