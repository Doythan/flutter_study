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

// class Student {
//   String name;
//   int age;
//   String? grade; // 선택적(null 가능)

//   Student({required this.name, required this.age, this.grade});
// }

// void main() {
//   Student s1 = Student(name: "철수", age: 20);
//   Student s2 = Student(name: "철수", age: 20, grade: "A");

//   print(s1.grade);
//   print(s2.grade);
// }

// class Dog {
//   String name;

//   Dog(this.name);

//   void speack() {
//     print("$name: 멍멍 !");
//   }
// }

// void main() {
//   Dog dog = Dog("바둑이");
//   dog.speack();
// }

// class Rectangle {
//   double width;
//   double height;

//   Rectangle(this.width, this.height);

//   // Getter
//   double get area => width * height;

//   // Setter
//   set setWidth(double newWidth) {
//     if (newWidth > 0) {
//       width = newWidth;
//     }
//   }
// }

// void main() {
//   Rectangle rect = Rectangle(10, 5);
//   print(rect.area);
//   rect.setWidth = 15;
//   print(rect.area);
// }

class Animal {
  String name;

  Animal(this.name);

  void speak() {
    print("$name: 소리를 냅니다.");
  }
}

class Cat extends Animal {
  Cat(String name) : super(name);

  @override
  void speak() {
    print("$name: 야옹!");
  }
}

void main() {
  Cat cat = Cat("나비");
  cat.speak();
}

// abstract class Vehicle {
//   void move(); // 자식 클래스가 반드시 구현해야 함
// }

// class Car extends Vehicle {
//   @override
//   void move() {
//     print("자동차가 달립니다.");
//   }
// }

// void main() {
//   Car car = Car();
//   car.move();
// }

// mixin Flyable {
//   void fly() {
//     print("하늘을 납니다!");
//   }
// }

// class Bird with Flyable {}

// void main() {
//   Bird bird = Bird();
//   bird.fly();
// }
