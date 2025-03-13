import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class Todo {
  final String id; // ✅ String 타입 유지, API 응답이 int이면 변환
  final String title;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"].toString(), // ✅ id를 String으로 변환
      title: json["title"],
      isCompleted: json["isCompleted"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
