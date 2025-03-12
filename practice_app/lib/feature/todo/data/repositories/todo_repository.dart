import '../models/todo_model.dart';

class TodoRepository {
  // ✅ 임시 데이터 리스트 (실제 앱에서는 API 또는 Local DB를 사용)
  final List<Todo> _todos = [];

  List<Todo> getTodos() => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
  }

  void toggleTodo(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index] =
          _todos[index].copyWith(isCompleted: !_todos[index].isCompleted);
    }
  }

  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
  }
}
