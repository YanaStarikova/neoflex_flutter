import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('setState'),),
      body: const MyHomepage(),
    ),
  ));
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  int _index = 0; //переменная для хранения текущего индекса

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _index, //текущий выбранный индекс
      onTap: (newIndex) { //обработчик нажатий на элементы 
        setState(() {
          _index = newIndex; //обновление состояния с новым индексом
        });
      }, items: [ //элементы панели навигации
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Домашняя'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Избранное'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Настройки'),
      ],
    );
  }
}
