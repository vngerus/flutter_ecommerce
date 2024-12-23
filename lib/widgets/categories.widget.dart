import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/pages/bloc/ecommerce_bloc.dart';
import 'package:flutter_ecommerce_app/widgets/app_colors.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"name": null, "icon": Icons.all_inclusive, "label": "All"},
      {"name": "Phones", "icon": Icons.phone_iphone, "label": "Phones"},
      {"name": "Consoles", "icon": Icons.videogame_asset, "label": "Consoles"},
      {"name": "Laptops", "icon": Icons.laptop, "label": "Laptops"},
      {"name": "TVs", "icon": Icons.tv, "label": "TVs"},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "See all",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.greyLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 80,
            child: BlocBuilder<EcommerceBloc, EcommerceState>(
              builder: (context, state) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemExtent: MediaQuery.of(context).size.width / 5,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = (category["name"] == null &&
                            state.selectedCategory == null) ||
                        (category["name"] != null &&
                            category["name"] == state.selectedCategory);

                    return GestureDetector(
                      onTap: () {
                        context.read<EcommerceBloc>().add(
                              SelectCategoryEvent(
                                category: category["name"] as String?,
                              ),
                            );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  isSelected ? AppColor.green : AppColor.white,
                              child: Icon(
                                category["icon"] as IconData,
                                size: 24,
                                color: isSelected
                                    ? AppColor.white
                                    : AppColor.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              category["label"] as String,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
