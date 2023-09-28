import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/models/cart_model.dart';
import 'package:flutter_sushi_app/pages/cart_page.dart';
import 'package:flutter_sushi_app/pages/home_page.dart';
import 'package:flutter_sushi_app/pages/menu_page.dart';
import 'package:flutter_sushi_app/utils/scroll_behavior.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
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
        '/cart': (context) => const CartPage(),
      },
    );
  }
}
