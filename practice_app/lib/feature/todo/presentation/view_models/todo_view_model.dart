import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/todo_model.dart';
import '../../data/repositories/todo_repository.dart';

// ✅ ViewModel (StateNotifier) 정의
class TodoNotifier extends StateNotifier<List<Todo>> {
  final TodoRepository repository;

  TodoNotifier(this.repository) : super(repository.getTodos());

  void addTodo(String title) {
    final newTodo = Todo(id: DateTime.now().toString(), title: title);
    repository.addTodo(newTodo);
    state = [...state, newTodo];
  }

  void toggleTodo(String id) {
    repository.toggleTodo(id);
    state = List.from(state);
  }

  void removeTodo(String id) {
    repository.removeTodo(id);
    state = state.where((todo) => todo.id != id).toList();
  }
}

// ✅ Provider 정의
final todoRepositoryProvider = Provider((ref) => TodoRepository());
final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>(
  (ref) => TodoNotifier(ref.read(todoRepositoryProvider)),
);
