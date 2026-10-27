import 'package:flutter/material.dart';
import 'pages/menu_page.dart';
import 'pages/tab_menu_page.dart';
import 'pages/shop_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.shade100,
          title: Row(
            children: [
              const SizedBox(width: 10),
              const Text('ปู๊น ปู๊นนน เดลิเวอร์รี่ '),
              Image.asset(
                'assets/images/delivery.png',
                width: 36,
                height: 36,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        body: const ShopPage(),
      ),
    );
  }
}
