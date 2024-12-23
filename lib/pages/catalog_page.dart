import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/categories.widget.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog"),
      ),
      body: const Column(
        children: [
          CategoriesWidget(),
          Expanded(
            child: Center(
              child: Text("Products coming soon!"),
            ),
          ),
        ],
      ),
    );
  }
}
