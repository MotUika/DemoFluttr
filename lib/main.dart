import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Widget gốc của ứng dụng, không thay đổi trạng thái
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Hello App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(), // Màn hình chính
    );
  }
}

// Màn hình chính, có thể thay đổi trạng thái
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _displayText = 'Chào mừng đến với Flutter!'; // Văn bản ban đầu
  Color _backgroundColor = Colors.lightBlue[100]!; // Màu nền ban đầu
  int _clickCount = 0; // Số lần nhấn nút

  // Hàm được gọi khi nhấn nút
  void _changeContent() {
    setState(() { // Cập nhật UI
      _clickCount++;
      if (_clickCount % 2 == 0) {
        _displayText = 'Chào bạn quay lại!';
        _backgroundColor = Colors.lightBlue[100]!;
      } else {
        _displayText = 'Nút đã nhấn $_clickCount lần!';
        _backgroundColor = Colors.lightGreen[100]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Cấu trúc giao diện cơ bản
      backgroundColor: _backgroundColor, // Đặt màu nền
      appBar: AppBar(
        title: const Text('Demo Tương Tác'),
        centerTitle: true,
      ),
      body: Center( // Căn giữa nội dung
        child: Column( // Sắp xếp các widget theo cột
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _displayText, // Hiển thị văn bản
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 30), // Khoảng cách
            ElevatedButton(
              onPressed: _changeContent, // Gán hàm _changeContent cho sự kiện nhấn nút
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Thay đổi Văn bản & Màu',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}