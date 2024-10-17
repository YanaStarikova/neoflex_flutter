import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dialog Demo'),
        ),
        body: const DialogPage(),
      ),
    );
  }
}

class DialogPage extends StatelessWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Показать диалог
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Заголовок'),
                content: const Text('Это содержимое диалога.'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop(); // Закрываем диалог
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Text('Показать диалог'),
      ),
    );
  }
}
