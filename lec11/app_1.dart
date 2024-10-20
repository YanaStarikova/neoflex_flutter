
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class App1 extends StatefulWidget{
  const App1 ({super.key});
  @override
  State<App1> createState()=> _App1State();
}

class _App1State extends State <App1>{
  final TextEditingController _data = TextEditingController(text: 'Текст для проверки записи');
  final _filename = 'temp_file.txt';
  final _formkey = GlobalKey<FormState>();

  Future <String> get _tempPath async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  Future <String> get _locaclPath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future <File> get _getFile async {
    final path = await _locaclPath;

    return File('$path/$_filename');
  }

  Future <File> writeData (String data) async{
    final file = await _getFile;
    return file.writeAsString(data);
  }

  Future <String> readData() async {
    try{
      final file = await _getFile;

      final contents = await file.readAsString();
      return contents;
    } catch(e){
      return ' ';
    }
  }

  Future <void> onSumbit() async{
    if(_formkey.currentState!.validate()){
      writeData(_data.text);

      setState(() {});
    }
  }

  Future <void> onDeleteFile() async {
    final file = await _getFile;

    if(file.existsSync()){
      file.deleteSync();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formkey,
        child: Padding(padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            FutureBuilder(future: _tempPath, 
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return Text('Temp folder: ${snapshot.data}');
            },
            ),

            const SizedBox(height: 16.0),
            FutureBuilder(future: _locaclPath, builder: (context, snapshot)
            {
              if(!snapshot.hasData){
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return Text('Document folder: ${snapshot.data}');
            }),

            const SizedBox(height: 16.0),
            FutureBuilder(future: readData(),
             builder: (context, snapshot)
            {
              if(!snapshot.hasData){
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if(snapshot.data!.isEmpty){
                return const SizedBox();
              }
              return Text('Data from file: ${snapshot.data}');
            }),

            const SizedBox(height: 16.0),
            TextFormField(
              controller: _data,
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Please enter data';
                }
                return null;
              },
              decoration: const InputDecoration(
                label: Text('Data'),
                border: OutlineInputBorder(),
              ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(onPressed: onSumbit, child: const Text('Sumbit')),
              const SizedBox(height: 16.0),
              ElevatedButton(onPressed: onDeleteFile, child: const Text('Delete file')),
          ],
        ),),
      ),
    );
  }
}