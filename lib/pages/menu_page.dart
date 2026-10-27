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
      imagePath: 'assets/images/greek-blue.jpg',
      description:
          'Greek yogurt with blueberry sauce and a soft creamy texture.',
    ),
    MenuItem(
      name: 'Honey Greek Yogurt',
      price: '89 baht',
      imagePath: 'assets/images/greek-honey.jpg',
      description:
          'Plain Greek yogurt with honey. Simple, smooth, and lightly sweet.',
    ),
    MenuItem(
      name: 'Granola Greek Yogurt',
      price: '119 baht',
      imagePath: 'assets/images/greek-granola.jpg',
      description:
          'Greek yogurt topped with crunchy granola for a fuller snack.',
    ),
  ];

  
  static final ValueNotifier<List<MenuItem>> _cartItems = ValueNotifier([]);

  // เก็บรายการเมนูในตะกร้า
  static void _addToCart(BuildContext context, MenuItem item) {
    _cartItems.value = [..._cartItems.value, item];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.name} added to cart (${_cartItems.value.length})'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),  // เพิ่มพื้นที่ขอบด้านใน 16 พิกเซลทั้ง 4 ด้าน
          child: Align(
            alignment: Alignment.centerRight,
            child: ValueListenableBuilder<List<MenuItem>>(
              valueListenable: _cartItems,
              builder: (context, cartItems, child) {
                return Text('Cart: ${cartItems.length}');
              },
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
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
                  child: _SampleCard(
                    item: item,
                    onAddCart: () => _addToCart(context, item),
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

// คลาส MenuDetailPage แสดงรายละเอียดของเมนูที่เลือก
// ใน Flutter ถ้าหน้านี้ถูกเปิดด้วย Navigator.push() จะมีปุ่ม back ให้อัตโนมัติ
class MenuDetailPage extends StatelessWidget {
  const MenuDetailPage({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ), // ปุ่ม back
        backgroundColor: Colors.lightBlue.shade100,
        title: Text(item.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Image.asset(item.imagePath, height: 220, fit: BoxFit.contain),
          const SizedBox(height: 24),
          Text(item.name, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(item.price, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          Text(item.description),
        ],
      ),
    );
  }
}

// ปุ่มเพิ่มสินค้าในตะกร้า
class ButtonAddCart extends StatelessWidget {
  const ButtonAddCart({super.key, required this.onPressed}); // บอกว่าคลาสนี้จะรับ parameter onPressed ซึ่งเป็นฟังก์ชันที่ไม่มีค่า return (VoidCallback)
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Colors.lightBlue,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: const Icon(Icons.add_circle_outline),
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}

// ui card
class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.item, required this.onAddCart});

  final MenuItem item;
  final VoidCallback onAddCart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(item.imagePath, width: 96, height: 96),
            const SizedBox(height: 12),
            Text(item.name, textAlign: TextAlign.center),
            Text(item.price),
            Align(
              alignment: Alignment.bottomRight,
              child: ButtonAddCart(onPressed: onAddCart),
            ),
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
