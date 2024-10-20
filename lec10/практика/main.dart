import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';


void main(){

  runApp(MaterialApp( home: Scaffold(
    appBar: AppBar(title: const Text('Bloc')),
    body: HomePage(),
  ),
  ));
}
abstract class ColorEvent{} //родительский класс для всех эвентов блока

class ColorChangePressed extends ColorEvent{}

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.green) {
    on<ColorChangePressed>( //обработка эвента нажатия кнопки
      (event, emit) => emit(Util.randomColor()),
    );
  }
}

class Util {
  // метод для генерации случайного цвета
  static Color randomColor() {
    return Color(Random().nextInt(0xffffffff)); // Возвращает случайный цвет
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider( //виджеты получают block в поддереве
        create: (context) => ColorBloc(),
        child: Center(child: BlocBuilder<ColorBloc, Color>(
          builder: (context, state) {
            return Container(
              width: 200,
              height: 200,
              color: state,
              child: Column(
                children: [
                  Text(state.toString()),
                  ElevatedButton(
                      onPressed: () {
                        context.read<ColorBloc>().add(ColorChangePressed());
                      },
                      child: const Text('Изменить цвет'))
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}

