import 'package:flutter/material.dart';

//null-aware Index Operator
//?[] - используется для индексации элемента списка

List<String>? myColors = ["Purple", "White", "Black"];
void main() {
myColors = null;
String? white = myColors?[1];

print(white); //null
}

