import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  // ประกาศรายการเมนูเป็น List ของ MenuItem
  static const List<MenuItem> _items = [
    MenuItem(
      name: 'Strawberry Greek Yogurt',
      price: '99 baht',
      imagePath: 'assets/images/strawberry.png',
      description:
          'Creamy Greek yogurt with strawberry filling. Sweet, fresh, and soft.',
    ),
    MenuItem(
      name: 'Blueberry Greek Yogurt',
      price: '109 baht',
      imagePath: 'assets/images/strawberry.png',
      description:
          'Greek yogurt with blueberry sauce and a soft creamy texture.',
    ),
    MenuItem(
      name: 'Honey Greek Yogurt',
      price: '89 baht',
      imagePath: 'assets/images/strawberry.png',
      description:
          'Plain Greek yogurt with honey. Simple, smooth, and lightly sweet.',
    ),
    MenuItem(
      name: 'Granola Greek Yogurt',
      price: '119 baht',
      imagePath: 'assets/images/strawberry.png',
      description:
          'Greek yogurt topped with crunchy granola for a fuller snack.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = _items[index];

        return Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuDetailPage(item: item),
                ),
              );
            },
            child: _SampleCard(item: item),
          ),
        );
      },
    );
  }
}

class MenuDetailPage extends StatelessWidget {
  const MenuDetailPage({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade100,
        title: Text(item.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Image.asset(
            item.imagePath,
            height: 220,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 24),
          Text(
            item.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            item.price,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Text(item.description),
        ],
      ),
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(item.imagePath, width: 96, height: 96),
            const SizedBox(height: 12),
            Text(
              item.name,
              textAlign: TextAlign.center,
            ),
            Text(item.price),
          ],
        ),
      ),
    );
  }
}

// ประกาศคลาส MenuItem เพื่อเก็บข้อมูลของเมนู เช่น ชื่อ ราคา รูปภาพ และคำอธิบาย
class MenuItem {
  const MenuItem({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
  });

  final String name;
  final String price;
  final String imagePath;
  final String description;
}
