import 'package:flutter/material.dart';


Future<int> sumStream(Stream<int> stream) async { //сложение значений потока
    int sum = 0;
    await for (int value in stream) {
        sum += value;
    }
    return sum;
}

Stream<int> countStream(int max) async* { //генератор потока
    for (int i = 0; i < max; i++) {
        yield i; //отправляем каждое число в поток
    }
}

void main() async{
  Stream <int> b = countStream(10); //создаем поток (сгенерирует числа от 0 до 9)
  int a = await sumStream(b); //передаем созданный поток и ожидаем результат функции sumStream(результат сложения от 0 до 9)
  print("Сумма: " + a.toString()); //печатаем результат
}