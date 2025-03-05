import 'package:flutter/material.dart';

class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack Example')),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 300, height: 200, color: Colors.blue),
            Positioned(
              bottom: 10,
              child: Text(
                '겹쳐진 텍스트 !',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
