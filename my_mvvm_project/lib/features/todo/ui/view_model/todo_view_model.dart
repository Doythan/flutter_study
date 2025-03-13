import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/todo_repository.dart';
import '../../domain/models/todo_model.dart';

class TodoNotifier extends StateNotifier<AsyncValue<List<Todo>>> {
  final TodoRepository repository;

  TodoNotifier(this.repository) : super(const AsyncValue.loading()) {
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    try {
      final todos = await repository.fetchTodos();
      state = AsyncValue.data(todos);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> addTodo(String title) async {
    final newTodo = Todo(id: DateTime.now().toString(), title: title);
    await repository.addTodo(newTodo);
    fetchTodos();
  }

  Future<void> toggleTodo(String id, bool isCompleted) async {
    await repository.toggleTodo(id, isCompleted);
    fetchTodos();
  }

  Future<void> removeTodo(String id) async {
    await repository.removeTodo(id);
    fetchTodos();
  }
}

// ✅ Provider 등록
final todoRepositoryProvider = Provider((ref) => TodoRepository());
final todoProvider =
    StateNotifierProvider<TodoNotifier, AsyncValue<List<Todo>>>(
  (ref) => TodoNotifier(ref.read(todoRepositoryProvider)),
);
