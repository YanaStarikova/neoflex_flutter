import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snackbar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Snackbar Demo'),
        ),
        body: const SnackbarPage(),
      ),
    );
  }
}

class SnackbarPage extends StatelessWidget {
  const SnackbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        // Когда кнопка нажата, показываем Snackbar.
        onTap: () {
          const snackBar = SnackBar(content: Text('Tap'));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        // Пользовательская кнопка
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'My Button',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
