import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/pages/bloc/ecommerce_bloc.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"name": "Phones", "icon": Icons.phone_iphone},
      {"name": "Consoles", "icon": Icons.videogame_asset},
      {"name": "Laptops", "icon": Icons.laptop},
      {"name": "Cameras", "icon": Icons.camera_alt},
      {"name": "TVs", "icon": Icons.tv},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "See all",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    context.read<EcommerceBloc>().add(
                          SelectCategoryEvent(
                            category: category["name"] as String,
                          ),
                        );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey.shade200,
                          child: Icon(
                            category["icon"] as IconData,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: 70,
                          child: Text(
                            category["name"] as String,
                            style: const TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
