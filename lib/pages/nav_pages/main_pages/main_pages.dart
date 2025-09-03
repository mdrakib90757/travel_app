import 'package:flutter/material.dart';
import 'package:travel_app/pages/nav_pages/bar_item_page/bar_item_page.dart';
import 'package:travel_app/pages/nav_pages/my_pages/my_pages.dart';
import 'package:travel_app/pages/nav_pages/search_pages/search_pages.dart';

import '../home_pages/home_pages.dart';

class MainPagesNavPage extends StatefulWidget {
  const MainPagesNavPage({super.key});

  @override
  State<MainPagesNavPage> createState() => _MainPagesNavPageState();
}

class _MainPagesNavPageState extends State<MainPagesNavPage> {

  List pages=[
    HomePages(),
    BarItemPage(),
    SearchPages(),
    MyPages(),

  ];
  int currentIndex=0;
void onTap(int index){
currentIndex=index;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
          onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.apps),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart),label: "bar"),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "My"),

      ]),
    );
  }
}
