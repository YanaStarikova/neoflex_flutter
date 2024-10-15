import 'package:flutter/material.dart';
//каскадный null-aware оператор
// .. - позволяет одновременно вызывать несколько методов для одного и того же объекта 
//или помогает установить несколько свойств для того же объекта

class Sport{
  String? name;
  int? players;
} 

Sport sport = Sport()
..name = "Football"
..players = 11;

void main() {
print(sport.name);
print(sport.players);
}

