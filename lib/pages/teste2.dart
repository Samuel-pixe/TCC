/*
ElevatedButton(
              onPressed: () async {
                // Selecionar arquivo CSV
                File? file = await pickFile(context);
                if (file == null) {
                  return;
                }

                // Ler arquivo CSV e enviar dados para o Firestore
                List<Map<String, dynamic>> csvData = await readCsv(file);
                CollectionReference collectionRef = FirebaseFirestore.instance.collection('alunos');
                for (Map<String, dynamic> data in csvData) {
                  if (data['id'] == null) {
                    await collectionRef.add({
                      'uid': FirebaseAuth.instance.currentUser!.uid.toString(),
                      'nome': data['nome'],
                      'email': data['email'],
                      'codigo': data['codigo'],
                    });
                  } else {
                    await collectionRef.doc(data['id']).set({
                      'uid': FirebaseAuth.instance.currentUser!.uid.toString(),
                      'nome': data['nome'],
                      'email': data['email'],
                      'codigo': data['codigo'],
                    });
                  }
                }

                // Mostrar mensagem de sucesso e fechar a tela
                Navigator.pop(context);
                sucesso(context, 'Dados enviados para o Firestore com sucesso.');
              },
              child: Text('Enviar dados do CSV para o Firestore'),
            ),

Future<File?> pickFile(BuildContext context) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['csv'],
  );

  if (result != null) {
    return File(result.files.single.path!);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Nenhum arquivo selecionado'),
    ));
    return null;
  }
}

Future<List<Map<String, dynamic>>> readCsv(File file) async {
  String csvString = await rootBundle.loadString(file.path);
  List<List<dynamic>> csvTable = CsvToListConverter().convert(csvString);
  List<Map<String, dynamic>> csvData = [];
  for (int i = 1; i < csvTable.length; i++) {
    Map<String, dynamic> row = {};
    row['nome'] = csvTable[i][0].toString();
    row['email'] = csvTable[i][1].toString();
    row['codigo'] = csvTable[i][2].toString();
    csvData.add(row);
  }
  return csvData;
}



Future<void> sendToFirestore(List<Map<String, dynamic>> csvData) async {
  CollectionReference collectionRef = FirebaseFirestore.instance.collection('alunos');

  for (Map<String, dynamic> data in csvData) {
    await collectionRef.add(data);
  }
}*/

import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Importar dados CSV',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Importar dados CSV'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Lê o arquivo CSV
            final String csvData = await rootBundle.loadString('assets/alunos.csv');
            List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);

            // Converte cada linha da tabela em uma string JSON e adiciona a uma lista de strings
            List<String> alunosJsonList = [];
            for (int i = 1; i < csvTable.length; i++) {
              Map<String, dynamic> aluno = {
                'nome': csvTable[i][0],
                'email': csvTable[i][1],
                'codigo': csvTable[i][2],
              };
              String alunoJson = jsonEncode(aluno);
              alunosJsonList.add(alunoJson);
            }

            // Salva a lista de strings no Firestore
            CollectionReference alunosRef = FirebaseFirestore.instance.collection('alunos');
            for (int i = 0; i < alunosJsonList.length; i++) {
              alunosRef.doc().set(json.decode(alunosJsonList[i]));
            }
          },
          child: Text('Importar dados CSV'),
        ),
      ),
    );
  }
}
/**/