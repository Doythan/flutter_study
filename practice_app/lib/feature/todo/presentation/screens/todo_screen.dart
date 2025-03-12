import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/todo_view_model.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    final todoNotifier = ref.read(todoProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("Todo List (Riverpod)")),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(
              todo.title,
              style: TextStyle(
                decoration:
                    todo.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            leading: Checkbox(
              value: todo.isCompleted,
              onChanged: (value) => todoNotifier.toggleTodo(todo.id),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => todoNotifier.removeTodo(todo.id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoNotifier.addTodo("새로운 할 일");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
