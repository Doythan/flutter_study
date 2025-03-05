import 'package:flutter/material.dart';

class ListviewExample extends StatelessWidget {
  const ListviewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Example')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.label, color: Colors.blue),
              title: Text('아이템 ${index + 1}'),
              subtitle: Text('설명 ${index + 1}'));
        },
      ),
    );
  }
}
