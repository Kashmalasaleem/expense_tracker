

import "package:flutter/material.dart";


class ProductListPage extends StatelessWidget {
  final String categoryName;
  final String subCategoryName;

  const ProductListPage({
    super.key,
    required this.categoryName,
    required this.subCategoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subCategoryName),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text("$subCategoryName Item ${index + 1}"),
              subtitle: Text("Category: $categoryName"),
              trailing: Text("Rs ${(index + 1) * 5000}"),
            ),
          );
        },
      ),
    );
  }
}
