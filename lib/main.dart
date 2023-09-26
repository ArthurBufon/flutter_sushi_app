import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/pages/food_details.dart';
import 'package:flutter_sushi_app/pages/home_page.dart';
import 'package:flutter_sushi_app/pages/menu_page.dart';
import 'package:flutter_sushi_app/utils/scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Sushi App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
      routes: {
        // Navigates to menu page.
        '/menupage': (context) => const MenuPage(),
      },
    );
  }
}
