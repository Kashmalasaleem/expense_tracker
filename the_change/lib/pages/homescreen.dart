import "package:flutter/material.dart";
import "package:the_change/pages/categoryscreen.dart";
import "package:the_change/widgets/category_model.dart";

class HomeScreen extends StatefulWidget {
  final List<CategoryModel> categories;

  const HomeScreen({super.key, required this.categories});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('OLX', style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Motors'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Property'),
                ),
              ],
            ),
          ),

          // Search field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(15),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => print("Heart pressed"),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide.none,
                      padding: EdgeInsets.zero,
                    ),
                    child: Icon(Icons.favorite_border, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),

          // Categories
          //
          //
          //
          //
          //
          //
          //
          //

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First row of 7 categories
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  separatorBuilder: (_, __) => SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final category = widget.categories[index];

                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CategoryScreen(category: category),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: category.image.isNotEmpty
                                ? Image.asset(category.image,
                                    fit: BoxFit.contain)
                                : Icon(Icons.category, size: 50),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: 100,
                            child: Text(
                              category.name,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 12), // Space between rows

              // Second row of 7 categories
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  separatorBuilder: (_, __) => SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final category = widget.categories[index + 7]; // next 7

                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CategoryScreen(category: category),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: category.image.isNotEmpty
                                ? Image.asset(category.image,
                                    fit: BoxFit.contain)
                                : Icon(Icons.category, size: 50),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: 100,
                            child: Text(
                              category.name,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
