import 'package:flutter/material.dart';
import 'dart:convert'; 
import 'package:http/http.dart' as http; 

class Album { // Класс для работы с альбомами
  final int userId; // Идентификатор пользователя
  final int id; // Идентификатор альбома
  final String title; // Заголовок альбома

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  // Фабричный конструктор для создания объекта Album из JSON
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  // Метод для преобразования объекта Album в JSON
  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id': id,
    'title': title
  }; 
}

class AlbumHttpProvider {
  // Метод для получения списка альбомов с API
  Future<List<Album>> fetchAlbum() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final list = jsonDecode(response.body); // Преобразуем тело ответа в JSON

    // Преобразуем каждый элемент списка в объект Album и возвращаем список
    return (list as List).map((e) => Album.fromJson(e)).toList();
  }
  Future <int> createAlbum (Album model) async{ // Метод для отправки альбома на сервер
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    body: jsonEncode(model));

    return response.statusCode;
  }
}

void main() {
  runApp(const MaterialApp(
    home: HttpPage(), // Запускаем приложение с основной страницей HttpPage
  ));
}

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState(); // Создаем состояние для HttpPage
}

class _HttpPageState extends State<HttpPage> {
  late final AlbumHttpProvider albumHttpProvider; // Провайдер для работы с API
  Future<List<Album>>? future; // Переменная для хранения будущего списка альбомов

  @override
  void initState() {
    super.initState();
    albumHttpProvider = AlbumHttpProvider(); // Инициализируем провайдер
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Позволяет прокручивать содержимое
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    future = albumHttpProvider.fetchAlbum(); // Запускаем запрос на получение альбомов
                  });
                },
                child: const Text('Получить альбомы'), // Кнопка для получения альбомов
              ),
              ElevatedButton(
                onPressed: () async{
                  {
                    final result = await albumHttpProvider.createAlbum(Album(userId: 1, id: 1, title: 'Test')); // Запускаем запрос на получение альбомов
                  if(mounted){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text('Запрос выполнен с кодом $result'),
                      );
                    });
                  }                 
                  };
                },
                child: const Text('Создать альбомы'), // Кнопка для создания альбома
              ),
              FutureBuilder(
                future: future, 
                builder: ((context, snapshot) {
                  if (snapshot.data != null && snapshot.hasData) {
                    return Column(
                      children: [
                        ...snapshot.data?.map((e) => Row(
                          children: [
                            Text('ID: ${(e.id)}'), 
                            Expanded(child: Text('Title: ${e.title}'))
                          ],
                        )) ?? []
                      ],
                    );
                  }
                  return const Text('No albums'); // Если альбомов нет, выводим сообщение
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
