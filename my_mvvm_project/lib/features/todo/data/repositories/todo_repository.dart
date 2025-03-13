import 'package:dio/dio.dart';
import '../../domain/models/todo_model.dart';

class TodoRepository {
  final Dio _dio = Dio();
  final String _baseUrl =
      "https://jsonplaceholder.typicode.com/todos"; // 임시 API

  Future<List<Todo>> fetchTodos() async {
    final response = await _dio.get(_baseUrl);
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((json) => Todo.fromJson(json))
          .toList();
    } else {
      throw Exception("Failed to fetch Todos");
    }
  }

  Future<void> addTodo(Todo todo) async {
    await _dio.post(_baseUrl, data: todo.toJson());
  }

  Future<void> toggleTodo(String id, bool isCompleted) async {
    await _dio.patch("$_baseUrl/$id", data: {"completed": isCompleted});
  }

  Future<void> removeTodo(String id) async {
    await _dio.delete("$_baseUrl/$id");
  }
}
