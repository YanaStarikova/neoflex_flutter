//работа с ключами
//вывод на экран 2 цветных квадрата и кнопки, которая будет изменять их порядок положения

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> tiles; //список для хранения цветных квадратов

@override
  void initState() {
    super.initState();
    tiles = [
      StatefullColorTile(
        key: UniqueKey(), //создание ключей
      ),
      StatefullColorTile(
        key: UniqueKey(),
      )
    ];
  }
  @override 
  Widget build (BuildContext context){
    return Scaffold(
      body: Center( //центрируем
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
          ),
      ),
       floatingActionButton: FloatingActionButton(onPressed: swapTiles, //обработчик нажатия кнопки
       child: const Icon(Icons.switch_access_shortcut)), //иконка для кнопки
    );
  }
  void swapTiles(){
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}
class StatefullColorTile extends StatefulWidget{
  const StatefullColorTile({super.key});

  @override
  State<StatefullColorTile> createState() => _StatefullColorfulTileState(); //создаем состояние для квадрата
}

class _StatefullColorfulTileState extends State <StatefullColorTile>{
  late Color color; //переменная для хранения цвета

  @override
  void initState() {
    super.initState();
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)]; //выбираем случайный цвет для квадрата
  }

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: color); //устанавливаем размер и цвет квадратам
  }
}
