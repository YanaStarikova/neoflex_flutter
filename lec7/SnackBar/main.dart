import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'SnackBar Demo',
    home: Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar Demo'),
      ),
      body: const SnackBarPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    ),
  ));
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Создаем SnackBar
          final snackBar = SnackBar(
            content: const Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Логика для отмены действия
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Action undone!')),
                );
              },
            ),
          );

          // Находим ScaffoldMessenger и отображаем SnackBar
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Show SnackBar'),
      ),
    );
  }
}
