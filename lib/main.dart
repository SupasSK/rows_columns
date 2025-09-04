import 'package:flutter/material.dart';

void main() => runApp(const Chap5App());

class Chap5App extends StatelessWidget {
  const Chap5App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapter 5: Rows & Columns',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo), useMaterial3: true),
      home: const Chap5Home(),
    );
  }
}

class Chap5Home extends StatelessWidget {
  const Chap5Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('บทที่ 5: Rows & Columns')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _h('5.2 Single vs Multi-child'),
            _p('Row/Column เป็น multi-child (มี children หลายตัว) ต่างจาก Container/Center ที่มักเป็น single-child.'),

            _h('5.3 Row: ตัวอย่างพื้นฐาน'),
            _card(Row(
              children: const [
                Icon(Icons.star,  size: 36, color: Colors.amber),
                Icon(Icons.settings, size: 36, color: Colors.blue),
                Icon(Icons.person, size: 36, color: Colors.purple),
              ],
            )),

            _h('5.3.1 Row: mainAxisAlignment'),
            _p('แกนหลักของ Row คือแนวนอน (Main Axis = horizontal).'),
            _card(Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.home, size: 40),
                Icon(Icons.shopping_cart, size: 40),
                Icon(Icons.person, size: 40),
              ],
            )),

            _h('5.3.2 Row: crossAxisAlignment'),
            _p('แกนรองของ Row คือแนวตั้ง (Cross Axis = vertical).'),
            _card(SizedBox(
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Tall text', style: TextStyle(fontSize: 30)),
                  SizedBox(width: 16),
                  Text('Short', style: TextStyle(fontSize: 16)),
                ],
              ),
            )),

            _h('5.3.3 Row: mainAxisSize'),
            _p('MainAxisSize.max = กว้างเต็มแนวนอน, MainAxisSize.min = กว้างเท่าที่ children ต้องการ.'),
            _card(Container(
              color: Colors.indigo.withOpacity(0.08),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Padding(padding: EdgeInsets.all(8), child: Text('min width row')),
                  Padding(padding: EdgeInsets.all(8), child: Icon(Icons.chevron_right)),
                ],
              ),
            )),

            _h('5.4 Column: ตัวอย่างพื้นฐาน'),
            _p('แกนหลักของ Column คือแนวตั้ง (Main Axis = vertical).'),
            _card(Column(
              children: const [
                Text('Line 1'),
                Text('Line 2'),
                Text('Line 3'),
              ],
            )),

            _h('5.4.1 Column: mainAxisAlignment'),
            _card(SizedBox(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.cloud, size: 40),
                  Icon(Icons.wb_sunny, size: 40),
                  Icon(Icons.umbrella, size: 40),
                ],
              ),
            )),

            _h('5.4.2 Column: crossAxisAlignment'),
            _card(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Short line'),
                Text('This is a much longer line of text'),
              ],
            )),

            _h('5.5 แก้ปัญหา Overflow ด้วย Expanded / Flexible'),
            _p('เมื่อ Row/Column มี children ที่กว้างเกินหน้าจอ → ใช้ Expanded/Flexible เพื่อแบ่งพื้นที่.'),
            _card(Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(height: 60, color: Colors.red),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: Container(height: 60, color: Colors.green),
                ),
                const SizedBox(width: 8),
                Container(height: 60, width: 60, color: Colors.blue),
              ],
            )),
            _p('Expanded = บังคับกินพื้นที่ที่เหลือตามสัดส่วน flex; Flexible = ยืดหยุ่น/หดได้แต่ไม่บังคับเต็ม.'),

            _h('5.6 Flexible (เปรียบเทียบสั้น ๆ)'),
            _card(Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(height: 60, color: Colors.orange),
                ),
                const SizedBox(width: 8),
                Flexible(
                  flex: 1,
                  child: Container(height: 60, color: Colors.teal),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.photo, size: 36),
              ],
            )),

            _h('5.7 Nested Rows & Columns (ซ้อนกัน)'),
            _card(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Header Section', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.account_circle, size: 40),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'รายละเอียดรายละเอียดรายละเอียด … (ตัวอย่างข้อความหลายบรรทัด)',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Action'),
                  ),
                ),
              ],
            )),

            _h('5.8 สรุปแนวคิด'),
            _bullet([
              'Row: แกนหลักแนวนอน / Column: แกนหลักแนวตั้ง',
              'mainAxisAlignment จัดเรียงตามแกนหลัก, crossAxisAlignment จัดตามแกนรอง',
              'mainAxisSize กำหนดให้กินพื้นที่เต็ม (max) หรือพอประมาณ (min)',
              'แก้ overflow ด้วย Expanded/Flexible หรือห่อด้วย SingleChildScrollView',
              'ซ้อน Row/Column เพื่อทำเลย์เอาท์ซับซ้อนได้',
            ]),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  static Widget _h(String t) => Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 6),
        child: Text(t, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      );

  static Widget _p(String t) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(t),
      );

  static Widget _card(Widget child) => Card(
        elevation: 0,
        color: Colors.indigo.withOpacity(0.04),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(padding: const EdgeInsets.all(12), child: child),
      );

  static Widget _bullet(List<String> items) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('•  '),
                      Expanded(child: Text(e)),
                    ],
                  ),
                ))
            .toList(),
      );
}
