// import "package:flutter/material.dart";

class CategoryModel {
  CategoryModel({required this.name, required this.image});
  String name;
  String image;

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.addAll(
      [
        CategoryModel(name: 'phone', image: ''),
        CategoryModel(name: 'vehicles', image: ''),
        CategoryModel(name: 'property for sale', image: ''),
        CategoryModel(name: 'property for rent', image: ''),
        CategoryModel(name: 'electronics & home appliances', image: ''),
        CategoryModel(name: 'bikes', image: ''),
        CategoryModel(name: 'business & industrial', image: ''),
      ],
    );

    categories.addAll([
      CategoryModel(name: 'services', image: ''),
      CategoryModel(name: 'jobs', image: ''),
      CategoryModel(name: 'animals', image: ''),
      CategoryModel(name: 'furniture & home decor', image: ''),
      CategoryModel(name: 'fashion & beauty', image: ''),
      CategoryModel(name: 'books & sports', image: ''),
      CategoryModel(name: 'kids', image: ''),
    ]);

    return categories;
  }
}
