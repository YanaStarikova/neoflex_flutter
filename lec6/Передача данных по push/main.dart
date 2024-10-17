import 'package:flutter/material.dart';

/* Передача простых данных

Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen(data: 'Hello')),
);
*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget { //главный экран
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(data:'Hello')), //передаем на второй экран аргумент data со значением Hello
            ); 
          },
          child: Text('Say Hello'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String data;
  SecondScreen({required this.data}); //получаем данные

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text(data)),
      );
  }
}

