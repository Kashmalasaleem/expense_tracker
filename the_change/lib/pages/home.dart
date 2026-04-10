import "package:flutter/material.dart";
import "package:the_change/pages/account_screen.dart";
import "package:the_change/pages/myads_screen.dart";
import "package:the_change/pages/sell_screen.dart";
import "package:the_change/widgets/category_model.dart";
import "package:the_change/pages/homescreen.dart";
import "package:the_change/pages/chatsscreen.dart";

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = CategoryModel.getCategories();

  int _currentIndex = 0;
  late final List<Widget> _pages;
  @override
  void initState() {
    super.initState();

    _pages = [
      HomeScreen(categories: categories),
      ChatsScreen(),
      SellScreen(),
      MyAdsScreen(),
      AccountScreen(),
    ];
  }
  //[

  //   HomeScreen(categories: categories),
  //   ChatsScreen(),
  //   Center(
  //     child: Text("Sell Screen"),
  //   ),
  //   Center(
  //     child: Text("My Ads Screen"),
  //   ),
  //   Center(
  //     child: Text("Account Screen"),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: "Sell",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: "My Ads",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}
