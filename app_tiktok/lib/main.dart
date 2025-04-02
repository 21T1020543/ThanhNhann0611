import 'package:app_tiktok/login_email_page.dart';
import 'package:app_tiktok/login_page.dart';
import 'package:app_tiktok/shopping_cart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login_page': (context) => const TikTokLoginPage(),
        '/login_email_page': (context) => const LoginEmailPage(),
        '/shopping_cart': (context) => ShoppingCartScreen(),
      },
      initialRoute: '/login_page',
    );
  }
}
