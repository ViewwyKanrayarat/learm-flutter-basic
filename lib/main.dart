import 'package:flutter/material.dart';
import 'pages/menu_page.dart';
import 'pages/tab_menu_page.dart';

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
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text('Greek Me Soft กรีกโยเกิร์ต'),
          ),
        ),
        // body: Center(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: const [
        //       Tile('A', HitType.hit), // เรียก widget Tile
        //       Tile('A', HitType.miss),
        //       Tile('A', HitType.partial),
        //     ],
        //   ), // เอา widget Tile ไปวางกลางหน้าจอ
        // ),
        body: const MenuPage(),
      ),
    );
  }
}

