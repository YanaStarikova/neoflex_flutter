import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
 runApp(MaterialApp(
      home:  Scaffold(
        appBar: AppBar(title: const Text('Ограничения полей')),
        body: MyCustomForm(),
        )),
     );
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>(); // создание GlobalKey

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'[0-9]')), //блокировка цифр
                LengthLimitingTextInputFormatter(4) //можно ввести только 4 элемента
              ],
            ),
            const SizedBox(height: 20), // Отступ между полем и кнопкой
            ElevatedButton( //кнопка для отправки формы
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

