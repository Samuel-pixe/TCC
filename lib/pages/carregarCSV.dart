import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TelaCadastroCSV extends StatefulWidget {
  const TelaCadastroCSV({Key? key}) : super(key: key);

  @override
  _TelaCadastroCSVState createState() => _TelaCadastroCSVState();
}


class _TelaCadastroCSVState extends State<TelaCadastroCSV> {
  List<List<dynamic>> _data = [];

  

  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("lib/data/dados.csv");
    List<List<dynamic>> _listData = const CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
      for(int i = 1; i < _listData.length; i++){
        FirebaseFirestore.instance.collection('alunos').add({
          'nome': _listData[i][0].toString(),
          'email': _listData[i][1].toString(),
          'codigo': _listData[i][2].toString(),

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CSVFirestore"),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (_, index) {
          return Card(
            margin: const EdgeInsets.all(3),
            color: index == 0 ? Colors.amber : Colors.white,
            child: ListTile(
              leading: Text(_data[index][0].toString()),
              title: Text(_data[index][1]),
              trailing: Text(_data[index][2].toString()),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: _loadCSV),
    );
  }
}