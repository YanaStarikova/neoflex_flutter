import 'package:flutter/material.dart';
//late - отложенная инициализация

class Person {
  late String name;
  late int age;
    Person (String name, int age){
    if(name != "admin") this.name = name;
    else this.name = "Undefine";
    
    if(age >0 && age < 111) this.age = age;
    else this.age = 18;
  }
  void display() => print("Name: $name \t Age: $age");
}


void main() {
  Person person = new Person("Anna", 18);
  person.display();
}

