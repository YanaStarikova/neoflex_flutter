import 'package:flutter/material.dart';
 
 //ListView
 /*ListView.builder() в качестве параметра itemBuilder принимает объект IndexedWidgetBuilder, который создает элементы списка. 
 Этот конструктор более удобен для создания больших списков*/
/*ListView.separated. Конструктор позволяет задать с помощью параметра itemBuilder функцию для создания элементов в ListView. 
C помощью дополнительного параметра separatorBuilder он позволяет задать функцию для создания границы между элементами*/

 const List <String> users = <String>["Yana", "Anya","Yana+Anya", "Flutter", "NeoFlex"];

 void main(){
  runApp(MaterialApp(
    home:Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: users.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index){
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(users[index], style:TextStyle(fontSize: 22))
          );
        },
      ),
    )
  ));
 }