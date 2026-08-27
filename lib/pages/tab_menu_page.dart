import 'package:flutter/material.dart';

class TabMenuPage extends StatelessWidget {
  const TabMenuPage({super.key});

  static const Color _navy = Color(0xFF073B72);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F6F9),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF3F6F9),
          foregroundColor: _navy,
          elevation: 0,
          titleSpacing: 4,
          title: const Text(
            'Greek Yogurt',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_rounded),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 16),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14073B72),
                  blurRadius: 18,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                const TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelColor: _navy,
                  unselectedLabelColor: Color(0xFF65758B),
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  indicatorColor: _navy,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3,
                  dividerColor: Color(0xFFE5EAF0),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  tabs: [
                    Tab(text: 'Sale Info'),
                    Tab(text: 'Contract Info'),
                    Tab(text: 'Realtime'),
                    Tab(text: 'History Note'),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      _TabContent(
                        icon: Icons.auto_awesome_rounded,
                        title: 'เมนูแนะนำสำหรับคุณ',
                        description: 'รวมเมนูรสชาติดีที่เราอยากให้คุณลอง',
                      ),
                      _TabContent(
                        icon: Icons.restaurant_menu_rounded,
                        title: 'เมนูกรีกโยเกิร์ตทั้งหมด',
                        description: 'เลือกดูโยเกิร์ตและท็อปปิงที่คุณชอบ',
                      ),
                      _TabContent(
                        icon: Icons.local_fire_department_rounded,
                        title: 'เมนูยอดนิยม',
                        description: 'เมนูขายดีที่ลูกค้าสั่งมากที่สุด',
                      ),
                      _TabContent(
                        icon: Icons.favorite_rounded,
                        title: 'รายการโปรด',
                        description: 'เมนูที่คุณบันทึกไว้จะแสดงที่นี่',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabContent extends StatelessWidget {
  const _TabContent({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: Color(0xFFE8F1FA),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 34, color: TabMenuPage._navy),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: TabMenuPage._navy,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF65758B),
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
