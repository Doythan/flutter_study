// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'feature/todo/presentation/screens/todo_screen.dart';

// void main() {
//   runApp(ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Flutter MVVM with Riverpod Todo App",
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: TodoScreen(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'feature/todo/presentation/screens/todo_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter MVVM with Riverpod",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TodoScreen(),
    );
  }
}
