import 'package:flutter/material.dart';
import '../game.dart';


// Tile คือ widget ที่แสดงตัวอักษรและสีของกล่อง
class Tile extends StatelessWidget {
  const Tile(
    this.letter,
    this.hitType, {
    super.key,
  }); // constructor ของคลาส Tile

  final String letter;
  final HitType hitType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      // วาด “หน้าตาของกล่อง”
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red.shade300),
        color: switch (hitType) {
          HitType.hit => Colors.green,
          HitType.partial => Colors.yellow,
          HitType.miss => Colors.grey,
          _ => Colors.white,
        },
      ),
      child: Center(
        child: Text(
          letter.toUpperCase(),
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: Colors.red),
        ),
      ),
    );
  }
}
