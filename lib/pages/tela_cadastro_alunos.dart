//import 'package:app_tcc/pages/widgets/botao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'dart:io';
//import 'package:csv/csv.dart';
//import 'package:flutter/services.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

import 'widgets/campo_texto.dart';
import 'widgets/mensagem.dart';

class TelaCadastroAlunos extends StatefulWidget {
  const TelaCadastroAlunos({Key? key}) : super(key: key);

  @override
  _TelaCadastroAlunosState createState() => _TelaCadastroAlunosState();
}

class _TelaCadastroAlunosState extends State<TelaCadastroAlunos> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtCodigo = TextEditingController();
  List<List<dynamic>> _data = [];
  String? filePath;

  //
  // getDocumentoById
  //
  getDocumentoById(id) async {
    await FirebaseFirestore.instance
        .collection('alunos')
        .doc(id)
        .get()
        .then((doc) {
      txtNome.text = doc.get('nome');
      txtEmail.text = doc.get('email');
      txtCodigo.text=doc.get('codigo');
    });
  }

  @override
  Widget build(BuildContext context) {
    //RECUPERAR o id do ALUNO que foi selecionado
    var id = ModalRoute.of(context)!.settings.arguments;
    if (id != null) {
      if (txtNome.text.isEmpty && txtEmail.text.isEmpty && txtCodigo.text.isEmpty) {
        getDocumentoById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
        color: Colors.black, // Defina a cor que deseja usar
        ),
        title: const Text('Cadastro de Alunos',
        style: TextStyle(
              fontFamily: 'GoogleFonts.lato',
              fontStyle: FontStyle.italic,
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: Colors.black,
              //Color.fromARGB(255, 20, 20, 20)
            ),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade300,
      ),
      backgroundColor: Colors.grey[50],
      
      body: Center(
        child: Container(
          width: 800,
            height: 800,
              decoration: BoxDecoration(
                
              borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [

            //botaoHoraio(controller, Icon.people)
            campoTexto('Nome', txtNome, Icons.people),
            const SizedBox(height: 20),
            campoTexto('Email', txtEmail, Icons.email),
            const SizedBox(height: 20),
            campoTexto('Codigo', txtCodigo, Icons.control_point),
            const SizedBox(height: 20),

          
          
          ElevatedButton(
          onPressed: () async {
            // Lê o arquivo CSV
            final String csvData = await rootBundle.loadString('lib/data/dados.csv');
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
          //ElevatedButton(onPressed: _loadCSV, child: const Text('Carregar CSV')),
          //  floatingActionButton: FloatingActionButton(
          //child: const Icon(Icons.add), onPressed: _loadCSV),
            

          const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.grey.shade900,
                    ),
                    child: const Text('salvar'),
                    onPressed: () {
                      if (id == null) {
                        FirebaseFirestore.instance.collection('alunos').add(
                          {
                            'uid' : FirebaseAuth.instance.currentUser!.uid.toString(),
                            'nome': txtNome.text,
                            'email': txtEmail.text,
                            'codigo': txtCodigo.text,
                          },
                        );
                        sucesso(context, 'O item foi adicionado com sucesso.');
                      } else {
                        FirebaseFirestore.instance
                            .collection('alunos')
                            .doc(id.toString())
                            .set(
                          {
                            'uid' : FirebaseAuth.instance.currentUser!.uid.toString(),
                            'nome': txtNome.text,
                            'email': txtEmail.text,
                            'codigo': txtCodigo.text,

                          },
                        );
                        sucesso(context, 'O item foi alterado com sucesso.');
                      }

                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.grey.shade900,
                      ),
                      child: const Text('cancelar'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            )
          ],
        ),
        ),
            
      ),
    );
  }

  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("lib\data\dados.csv");
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
  }/**/



}