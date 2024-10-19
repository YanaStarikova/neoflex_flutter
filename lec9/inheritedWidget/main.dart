import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(AppDataProvider(
    appData: AppData(backgroundColor: Colors.green), // Инициализация AppData с зеленым фоном
    child: const MaterialApp(
      home: HomePage(), // Главная страница приложения
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

class AppData {
  Color backgroundColor; // Цвет фона приложения

  AppData({required this.backgroundColor}); 

  // Метод для изменения цвета фона
  void changeBackgroundColor(Color newColor) {
    backgroundColor = newColor;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), 
      body: Center(
          child: Container(
        width: 200, // Ширина контейнера
        height: 200, // Высота контейнера
        color: AppDataProvider.of(context)?.appData.backgroundColor, // Устанавливает цвет фона
        child: Column(
          children: [
            // Отображение текущего цвета фона в текстовом формате
            Text(AppDataProvider.of(context)
                    ?.appData
                    .backgroundColor
                    .toString() ?? ''),
            ElevatedButton(             // Кнопка для изменения цвета фона
                onPressed: () {
                  setState(() {
                    AppDataProvider.of(context)                    // Изменение цвета фона на случайный
                        ?.appData
                        .changeBackgroundColor(Util.randomColor());
                  });
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
    return Color(Random().nextInt(0xffffffff)); // Возвращает случайный цвет
  }
}
