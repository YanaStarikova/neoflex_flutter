//код из начала видео-лекции
import 'package:flutter/material.dart';

void main() {
  runApp(
    Container(
      color: Colors.lime,
    ),
  );
}

class ColorContainer extends StatelessWidget{
  const ColorContainer({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}