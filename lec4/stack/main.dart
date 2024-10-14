import 'package:flutter/material.dart';

/*Stack({Key key, AlignmentGeometry alignment: AlignmentDirectional.topStart, TextDirection textDirection, 
StackFit fit: StackFit.loose, Overflow overflow: Overflow.clip, Clip clipBehavior: Clip.hardEdge, 
List<Widget> children: const <Widget>[]})*/ // конструктор Stack - расположение одних элементов поверх других 

/*Positioned.directional({Key key, @required TextDirection textDirection, double start, 
double top, double end, double bottom, double width, double height, @required Widget child}):*/ // - конструктор Positioned.directional

/*Positioned.fill({Key key, double left: 0.0, double top: 0.0, 
double right: 0.0, double bottom: 0.0, @required Widget child})*/ // определяет расположение вложенного виджета с помощью установки параметров

/*Positioned.fromRect({Key key, Rect rect, @required Widget child}) - расположение и размеры вложенные элемента задаются с помощью объекта Rect
Positioned.fromRelativeRect({Key key, RelativeRect rect, @required Widget child}) - расположение и размеры вложенные элемента задаются с помощью объекта RelativeRect*/

void main() {
  runApp(Container
  (
    color: Colors.white,
    padding: EdgeInsets.only(top:40, bottom: 10, left: 20, right: 20),

    child: Stack(
      textDirection: TextDirection.ltr,
      children: <Widget>[

        Container(
          width: 200,
          height: 200,
          color: Colors.lime,
        ),

        Container(
          width: 160,
          height: 160,
          color: const Color.fromARGB(255, 78, 170, 98),
        ),

        Container(
          width: 100,
          height: 100,
          color: Colors.purpleAccent,
        ),
        
      ],
    )
  )
  );
}