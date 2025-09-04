import 'package:flutter/material.dart';

class ExplorePages extends StatefulWidget {
  const ExplorePages({super.key});

  @override
  State<ExplorePages> createState() => _ExplorePagesState();
}

class _ExplorePagesState extends State<ExplorePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text("Explore Pages")),
    );
  }
}
