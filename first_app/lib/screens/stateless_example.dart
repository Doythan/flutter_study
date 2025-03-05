import 'package:flutter/material.dart';

class StatelessExample extends StatelessWidget {
  const StatelessExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StatelessWidget Example')),
      body: Center(
        child: Text('안녕하세요, Flutter!'),
      ),
    );
  }
}
