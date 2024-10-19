import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // Запускает приложение с использованием ChangeNotifierProvider для управления состоянием AppData
  runApp(ChangeNotifierProvider(
    create: (context) => AppData(backgroundColor: Colors.green),
    child: const MaterialApp(
      home: HomePage(),
    ),
  ));
}

class AppDataProvider extends InheritedWidget {
  const AppDataProvider({required this.appData, required super.child, super.key});

  final AppData appData;

  // Метод для получения текущего AppDataProvider из контекста
  static AppDataProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDataProvider>();

  @override
  // Метод, который определяет необходимость обновления дочерних виджетов
  bool updateShouldNotify(AppDataProvider oldWidget) {
    return true; // Всегда уведомляем дочерние виджеты
  }
}

class AppData with ChangeNotifier {
  Color backgroundColor;

  AppData({required this.backgroundColor}); 

  // Метод изменения цвета фона и уведомления слушателей
  void changeBackgroundColor(Color newColor) {
    backgroundColor = newColor;
    notifyListeners(); // Уведомляем всех слушателей о изменении состояния
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Container(
        width: 200, 
        height: 200, 
        color: context.watch<AppData>().backgroundColor, // Устанавливает цвет фона из AppData
        child: Column(
          children: [
            // Отображение текущего цвета фона в текстовом формате
            Text(context.watch<AppData>().backgroundColor.toString()),
            ElevatedButton(    // Кнопка для изменения цвета фона
                onPressed: () {
                  context
                      .read<AppData>()
                      .changeBackgroundColor(Util.randomColor()); // Изменение цвета фона на случайный
                },
                child: const Text('Изменить цвет'))
          ],
        ),
      )),
    );
  }
}

class Util {
  // метод для генерации случайного цвета
  static Color randomColor() {
    return Color(Random().nextInt(0xffffffff)); 
  }
}
