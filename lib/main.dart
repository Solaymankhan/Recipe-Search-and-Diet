import 'package:flutter/material.dart';
import 'package:recipe_search_and_diet/utils/constants/colors.dart';
import 'package:recipe_search_and_diet/viewAndViewModel/searchItems/searchItemsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Search and Diet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: greenColor),
        useMaterial3: true,
      ),
      home: searchItemsPage(),
    );
  }
}


