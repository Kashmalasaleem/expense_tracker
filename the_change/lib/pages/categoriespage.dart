import "package:flutter/material.dart";
import "package:the_change/pages/subcategorypage.dart";
import "package:the_change/widgets/category_model.dart";

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  final List<CategoryModel> categories = CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index].name),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubCategoryPage(
                    categoryName: categories[index].name,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
