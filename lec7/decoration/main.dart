import 'package:flutter/material.dart';

void main() {
 runApp(MaterialApp(
      home:  Scaffold(
        body: TextField(decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Введите логин",
            fillColor: Colors.greenAccent, //окраска фона
            filled: true
        )),
     )
  ));
}

