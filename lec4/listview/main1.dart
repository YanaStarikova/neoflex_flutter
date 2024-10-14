import 'package:flutter/material.dart';
 
 //ListView

 const double tSize = 22;

 void main(){
  runApp(MaterialApp(
    home:Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Text("Yana", style: TextStyle(fontSize: tSize)),
          Text("Anya", style: TextStyle(fontSize: tSize)),
          Text("Yana+Anya", style: TextStyle(fontSize: tSize)),
        ],
      ),
    )
  ));
 }