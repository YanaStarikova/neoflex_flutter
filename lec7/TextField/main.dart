import 'package:flutter/material.dart';

void main() {
   runApp(MaterialApp(
      home:  Scaffold(
        body: TextField( //ввод текста
            onSubmitted: (text) {
              print("onSubmitted");
              print("Введенный текст: $text");
            },
            onChanged: (text) {
              print("onChanged");
              print("Введенный текст: $text");
        }),
     )
  ));
}
