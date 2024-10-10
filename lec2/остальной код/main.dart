//код из лекции и последнее пример из видео-лекции
import 'package:flutter/material.dart';

// runApp
/*void main() { //без иерахии
  runApp(
  Text(
    'Hello word',
    textDirection: TextDirection.ltr,
    textAlign: TextAlign.center,
  ),
);
}*/

/*void main() { //иерархическая 
  runApp(
    Align (
    alignment: Alignment.center,
    child: Text(
    'Hello word',
    textDirection: TextDirection.ltr,
      ),
    ),
  );
}*/


//MaterialApp
/*void main ()  {
  runApp( const MaterialApp(
    title: 'MyApp',
    home: MyHomePage(),
  ));
}*/


//Scaffold
/*void main(){
  runApp(MaterialApp(
    home:Scaffold(
      body: Container(
        color: Colors.lightBlue,
        padding: EdgeInsets.only(top:25),
        child: Text("Hello World",
        style: TextStyle(fontSize: 22,color: Colors.black87),
        textDirection: TextDirection.ltr),
      ),
    ),
  ));
}*/


//Stateless Widget - виджет без состояния
/*class MyStatelessWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     
    return Container(
      color: Colors.white,
    );
  }
}*/


//StatefulWidget - класс, хранящий состояние виджетов
/*void main() {
  runApp(MaterialApp(
      home:  Scaffold(
        body: Counter(),
        appBar: AppBar(title: Text("Title")),)
  ));
}

class Counter extends StatefulWidget{
  Counter({ super.key});
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter>{
 
  int value = 0;
 
  @override
  Widget build(BuildContext context) {
 
    return ElevatedButton( //кнопка
        child: Text("Value: $value", style: TextStyle(fontSize: 22)),
        onPressed:(){ setState(() {
          value++;
        });}
    );
  }
}*/


//работа с assert, image И font
void main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.add))],
      ),
      body: const ColorContainer(
        color: Colors.white,
      ),
      floatingActionButton: 
      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
)));
}

class ColorContainer extends StatefulWidget{
  const ColorContainer ({super.key, required this.color});

  final Color color;

  @override
  State<ColorContainer> createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer> {
  late Color color;

  @override
  void initState() {
    super.initState();
    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        setState(() {
          color = Colors.green;
        });
      },
      child: Container(
        color: color,
        //child: Text('Text', style: TextStyle(fontFamily: "LeoHand", fontSize: 25), )//загрузка шрифта
        child: Image.asset('assets/кошк.jpg'), //загрузка картинки
      ),
    );
  }
}
