import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0); // 전역 상태(Provider)

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Riverpod 예제")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "카운트 $count",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () =>
                    ref.read(counterProvider.notifier).state++, // 상태변경
                child: Text("증가"))
          ],
        ),
      ),
    );
  }
}
