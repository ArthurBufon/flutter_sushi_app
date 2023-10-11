import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/models/cart_model.dart';
import 'package:flutter_sushi_app/pages/cart_page.dart';
import 'package:flutter_sushi_app/pages/home_page.dart';
import 'package:flutter_sushi_app/pages/menu_page.dart';
import 'package:flutter_sushi_app/utils/scroll_behavior.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD67efCaQ7MWW6yu6xyqLVuR-Ucij3yxWk",
      authDomain: "flutter-sushi-app-f5b7d.firebaseapp.com",
      projectId: "flutter-sushi-app-f5b7d",
      storageBucket: "flutter-sushi-app-f5b7d.appspot.com",
      messagingSenderId: "428064814429",
      appId: "1:428064814429:web:14c1b52743500ba67424b4"
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
