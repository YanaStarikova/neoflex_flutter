import 'package:flutter/material.dart';

/* Именованные пути

MaterialApp(
  routes: {
    '/': (context) => HomeScreen(),
    '/second': (context) => SecondScreen(),
  },
);

Navigator.pushNamed(context, '/second');*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name Routes Example',
      routes:{
      '/': (context)=> FirstScreen(), //первый, главный экран
      '/second': (context) => SecondScreen(), //второй
      }//второй экран
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
            Navigator.pushNamed(context, '/second'); //переход на второй экран по именованному пути
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
          Navigator.pushNamed(context, '/'); //возврат именованному пути
        },
        child: Text("Go to First Screen"),
        ),
      ),
    );
  }
}

