import 'package:flutter/material.dart';

void main() {
  runApp(Container(
    padding: EdgeInsets.only(top:25),
    
    color: Colors.white,

    child:Row(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
              child: Container(color: const Color.fromARGB(255, 197, 244, 166)),
              flex: 3,
          ),
          Expanded(
              child: Container(color: const Color.fromARGB(255, 206, 244, 54)),
              flex:1
          ),
          Expanded(
              child: Container(color: const Color.fromARGB(255, 165, 175, 233)),
              flex: 2,
          )
        ]
      )
    )
  );
}

//Padding({Key key, @required EdgeInsetsGeometry padding, Widget child}) // конструктор padding - устанавливает отступы

//Align({Key key, AlignmentGeometry alignment: Alignment.center, double widthFactor, double heightFactor, Widget child}) //конструктор align - выравнивает элементы

//Center({Key key, double widthFactor, double heightFactor, Widget child}) // конструктор center - располагает вложенный элемент по центру 

/*Container({Key key, AlignmentGeometry alignment, EdgeInsetsGeometry padding, Color color, Decoration decoration, 
Decoration foregroundDecoration, double width, double height, BoxConstraints constraints, EdgeInsetsGeometry margin, 
Matrix4 transform, Widget child, Clip clipBehavior: Clip.none})*/ //конструктор Container - содержит только один вложенный элемент, но при этом предоставляет доп возможности по настройке фона, позиционирования и размера вложенных виджетов

/*Row({Key key, MainAxisAlignment mainAxisAlignment: MainAxisAlignment.start, MainAxisSize mainAxisSize: MainAxisSize.max, 
CrossAxisAlignment crossAxisAlignment: CrossAxisAlignment.center, TextDirection textDirection, 
VerticalDirection verticalDirection: VerticalDirection.down, TextBaseline textBaseline, List<Widget> children: const []})*/ // конструктор Row - располагает элементы по горизонтали, в виде строки

/*Column({Key key, MainAxisAlignment mainAxisAlignment: MainAxisAlignment.start, MainAxisSize mainAxisSize: MainAxisSize.max, 
CrossAxisAlignment crossAxisAlignment: CrossAxisAlignment.center, TextDirection textDirection, 
VerticalDirection verticalDirection: VerticalDirection.down, TextBaseline textBaseline, List<Widget> children: const []})*/ // конструктор Column - располагает элементы вертикально, в виде столбика

//Expanded({Key key, int flex: 1, @required Widget child}) // коструктор Expanded позволяет своему вложенному виджету child заполнить доступное пространство (или его часть) других контейнеров - Row и Column.


