import 'package:flutter/material.dart';

void main() {
   runApp(MaterialApp(
    onGenerateRoute: (settings) {
      var path = settings.name?.split('/') ?? [];

      if (settings.name == '/') {
        return MaterialPageRoute(builder: (context) {
          return const HomePage();
        });
      }

      if ((path.length >= 3) && path[1] == 'second') {
        return MaterialPageRoute(builder: (context) {
          return SecondPage(data: path[2]);
        });
      }
      return MaterialPageRoute(builder: (context) {
        return const HomePage();
      });
    },
  ));
}

class HomePage extends StatelessWidget{
  const HomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // переходим на второй экран с передачей данных
            Navigator.pushNamed(context, '/second/hello,flutter!');
          },
          child: const Text('Go to Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String data;

  const SecondPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Text(
          data,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}