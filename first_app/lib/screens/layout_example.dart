import 'package:flutter/material.dart';

class LayoutExample extends StatelessWidget {
  const LayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row & Column Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, size: 50, color: Colors.yellow),
                Icon(Icons.favorite, size: 50, color: Colors.red),
                Icon(Icons.thumb_up, size: 50, color: Colors.blue),
              ],
            ),
            SizedBox(height: 20),
            Text('위젯을 정렬하는 연습!', style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}
