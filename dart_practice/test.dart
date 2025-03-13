// class Person {
//   String name;
//   int age;

//   // 생성자(클래스를 만들 때 실행됨)
//   Person(this.name, this.age);
// }

// void main() {
//   Person p1 = Person("홍길동", 25);
//   print(p1.name);
//   print(p1.age);
// }

// class Animal {
//   String name;
//   int age;

//   Animal({this.name = "이름 없음", this.age = 0});
// }

// void main() {
//   Animal a1 = Animal();
//   Animal a2 = Animal(name: "강아지", age: 3);

//   print(a1.name);
//   print(a2.name);
// }

class Student {
  String name;
  int age;
  String? grade; // 선택적(null 가능)

  Student({required this.name, required this.age, this.grade});
}

void main() {
  Student s1 = Student(name: "철수", age: 20);
  Student s2 = Student(name: "철수", age: 20, grade: "A");

  print(s1.grade);
  print(s2.grade);
}
