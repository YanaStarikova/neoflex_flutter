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
          onPressed: () async {
            // переходим на второй экран с передачей данных
              final result = await Navigator.of(context).pushNamed('/second/hello');
          },
          child: const Text('Go to Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String data;

  const SecondPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(data),
            ElevatedButton(onPressed: (){Navigator.of(context).pop('test');}, //возвращаем строку тест
            child: const Text('Back'))
          ]
        ),
      ),
    );
  }
}