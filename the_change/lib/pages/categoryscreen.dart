import "package:flutter/material.dart";
import "package:the_change/widgets/category_model.dart";
import "package:the_change/pages/productListPage.dart";

class CategoryScreen extends StatelessWidget {
  final CategoryModel category;

  CategoryScreen({super.key, required this.category});

  final Map<String, List<String>> subCategories = {
    "phone": ["iPhone", "Samsung", "Oppo", "Vivo"],
    "vehicles": ["Cars", "Bikes", "Buses"],
    "property for sale": ["House", "Apartment", "Plot"],
    "property for rent": ["House Rent", "Shop Rent"],
    "electronics & home appliances": ["TV", "Laptop", "AC"],
    "bikes": ["Honda", "Yamaha"],
    "business & industrial": ["Machinery", "Office Equipment"],
    "services": ["Repairing", "Cleaning"],
    "jobs": ["IT Jobs", "Marketing Jobs"],
    "animals": ["Cats", "Dogs"],
    "furniture & home decor": ["Sofa", "Bed"],
    "fashion & beauty": ["Clothes", "Makeup"],
    "books & sports": ["Books", "Gym Equipment"],
    "kids": ["Toys", "Baby Clothes"],
  };

  @override
  Widget build(BuildContext context) {
    final items = subCategories[category.name] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductListPage(
                    categoryName: category.name,
                    subCategoryName: items[index],
                  ),
                ),
              );

              // Later we connect this to ProductListPage
            },
          );
        },
      ),
    );
  }
}
