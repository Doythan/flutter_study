import 'dart:convert';

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  // ✅ API 응답(JSON) → User 객체 변환
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  // ✅ User 객체 → JSON 변환 (필요할 경우)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  // ✅ JSON 리스트 → User 리스트 변환
  static List<User> fromJsonList(String jsonString) {
    List<dynamic> decoded = json.decode(jsonString);
    return decoded.map((json) => User.fromJson(json)).toList();
  }
}
