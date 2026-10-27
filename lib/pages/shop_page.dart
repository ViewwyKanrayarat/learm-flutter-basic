import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class ShopItem {
  const ShopItem({
    required this.name,
    required this.imagePath,
    required this.description,
  });

  final String name;
  final String imagePath;
  final String description;
}

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});
  static const _shopItems = [
    ShopItem(
      name: 'ข้าวแกง ป้าศรี - ถนนแจ้งวัฒนะ 6',
      imagePath: 'assets/images/logo.png',
      description: 'ร้านข้าวแกงจ้า เชิญชิม',
    ),
    ShopItem(
      name: 'ข้าวแกง ป้าศรี',
      imagePath: 'assets/images/strawberry.png',
      description: 'ร้านข้าวแกงจ้า เชิญชิม',
    ),
    ShopItem(
      name: 'ข้าวแกง ป้าศรี',
      imagePath: 'assets/images/strawberry.png',
      description: 'ร้านข้าวแกงจ้า เชิญชิม',
    ),
    ShopItem(
      name: 'ข้าวแกง ป้าศรี',
      imagePath: 'assets/images/strawberry.png',
      description: 'ร้านข้าวแกงจ้า เชิญชิม',
    ),
    ShopItem(
      name: 'ข้าวแกง ป้าศรี',
      imagePath: 'assets/images/strawberry.png',
      description: 'ร้านข้าวแกงจ้า เชิญชิม',
    ),
    ShopItem(
      name: 'ข้าวแกง ป้าศรี',
      imagePath: 'assets/images/strawberry.png',
      description: 'ร้านข้าวแกงจ้า เชิญชิม',
    ),
    ShopItem(
      name: 'ข้าวแกง ป้าศรี',
      imagePath: 'assets/images/strawberry.png',
      description: 'ร้านข้าวแกงจ้า เชิญชิม',
    ),
    ShopItem(
      name: 'Greek Yogurt',
      imagePath: 'assets/images/greek-blue.jpg',
      description: 'กรีกโยเกิร์ตเปิดหลังเลิกงาน',
    ),
    ShopItem(
      name: 'Greek Yogurt',
      imagePath: 'assets/images/greek-blue.jpg',
      description: 'กรีกโยเกิร์ตเปิดหลังเลิกงาน',
    ),
    ShopItem(
      name: 'Greek Yogurt',
      imagePath: 'assets/images/greek-blue.jpg',
      description: 'กรีกโยเกิร์ตเปิดหลังเลิกงาน',
    ),
    ShopItem(
      name: 'Greek Yogurt',
      imagePath: 'assets/images/greek-blue.jpg',
      description: 'กรีกโยเกิร์ตเปิดหลังเลิกงาน',
    ),
    ShopItem(
      name: 'Greek Yogurt',
      imagePath: 'assets/images/greek-blue.jpg',
      description: 'กรีกโยเกิร์ตเปิดหลังเลิกงาน',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // debugPrint('ShopPage context: $context');
    // debugPrint('Current widget: ${context.widget.runtimeType}');
    return Column(
      children: [
        Padding(padding: const EdgeInsets.all(12)),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),

            itemCount: _shopItems.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final x = _shopItems[index];
              return Card(
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ), // กำหนดความโค้งมนที่นี่ (ปรับตัวเลขได้)
                              child: Image.asset(
                                x.imagePath,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.red,
                                  child: Text(
                                    x.name,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleLarge,
                                    
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(x.description),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
