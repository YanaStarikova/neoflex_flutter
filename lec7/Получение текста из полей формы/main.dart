import 'package:flutter/material.dart';
 
void main() {
  runApp(MaterialApp(
      home:  Scaffold(
        body: Person(),
       )
  ));
}
 
class Person extends StatefulWidget {
 
  Person({ Key? key}) : super(key: key);
 
  @override
  _PersonState createState() => _PersonState();
}
class _PersonState extends State<Person>{
 
  String _name = "Yana"; //имя по умолчанию
  final _controller = TextEditingController();
  _changeName(){
    setState(() =>_name = _controller.text); //установка нового имени из текстового поля
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
    @override 
  void initState() {
    super.initState();
    _controller.text = _name;
    _controller.addListener(_changeName);
  }

  @override
  Widget build(BuildContext context) {
 
    return Column(children:[
      Text("Имя пользователя: $_name", style: TextStyle(fontSize: 22)),
      TextField(
          style: TextStyle(fontSize: 22),
          controller: _controller)
    ],
    crossAxisAlignment: CrossAxisAlignment.start);
  }
}