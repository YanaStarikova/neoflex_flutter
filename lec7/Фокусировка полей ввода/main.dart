import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Фокусировка полей ввода'),
      ),
      body: MyCustomForm(),
    ),
  ));
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
    FloatingActionButton( //фокусировка поля
    onPressed: () => myFocusNode.requestFocus(),
);
  }

  @override
  Widget build(BuildContext context) {
      return TextField(
    focusNode: myFocusNode,);
    
  }
  
}