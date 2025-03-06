import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ✅ To-Do 리스트 상태 관리 (StateNotifierProvider 사용)
final todoListProvider = StateNotifierProvider<TodoListNotifier, List<String>>(
  (ref) => TodoListNotifier(),
);

class TodoListNotifier extends StateNotifier<List<String>> {
  TodoListNotifier() : super([]);

  void addTodo(String todo) {
    state = [...state, todo]; // ✅ 새로운 할 일 추가
  }

  void removeTodo(int index) {
    state = [...state]..removeAt(index); // ✅ 할 일 삭제
  }
}

void main() {
  runApp(const ProviderScope(child: MyApp())); // ✅ ProviderScope 추가
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App (Riverpod)',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider); // ✅ 상태 읽기
    final todoNotifier = ref.read(todoListProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text('To-Do App (Riverpod)')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: '할 일 입력'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      todoNotifier
                          .addTodo(_controller.text); // ✅ Riverpod 상태 변경
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () =>
                        todoNotifier.removeTodo(index), // ✅ Riverpod 상태 변경
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
