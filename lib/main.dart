import 'package:flutter/material.dart';
import 'pages/game_page.dart';

// จุดเริ่มต้นของแอป
void main() {
  runApp(const MainApp());
}

// TODO เวลาสร้างคลาสจะใช้ StatelessWidget หรือ StatefulWidget ขึ้นอยู่กับว่าคลาสนั้นต้องการเก็บสถานะหรือไม่

// mainApp คือ layout
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text('Birdle Game'),
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
        body: Center(child: GamePage()),
      ),
    );
  }
}



