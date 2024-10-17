import 'package:flutter/material.dart';

/*Navigator - виджет для упралением экранов
push: помещает новый экран в стек.
pop: удаляет текущий экран из стека и возвращает к предыдущему экрану.
popUntil: удаляет все экраны из стека до тех пор, пока не будет выполнено определенное условие.
pushReplacement: заменяет текущий экран новым экраном.
pushNamed: помещает именованный маршрут в стек. 

Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()), - перемещение экрана в стек
);

Navigator.pop(context); - возврат */

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Example',
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()), //переход на второй экран
            );
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed:() {
          Navigator.pop(context); //возврат
        },
        child: Text("Go to First Screen"),
        ),
      ),
    );
  }
}

