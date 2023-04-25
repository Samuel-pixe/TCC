import 'package:app_tcc/pages/widgets/texto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets/campo_texto.dart';
import 'widgets/mensagem.dart';

class TelaCadastroDeSalas extends StatefulWidget {
  const TelaCadastroDeSalas({Key? key}) : super(key: key);

  @override
  _TelaCadastroDeSalasState createState() => _TelaCadastroDeSalasState();
}

class _TelaCadastroDeSalasState extends State<TelaCadastroDeSalas> {
  var txtNumeroSala = TextEditingController();
  var txtSoftwares = TextEditingController();
  //var txtCodigo = TextEditingController();

  //
  // getDocumentoById
  //
  getDocumentoById(id) async {
    await FirebaseFirestore.instance
        .collection('salas')
        .doc(id)
        .get()
        .then((doc) {
      txtNumeroSala.text = doc.get('numero da sala');
      txtSoftwares.text = doc.get('softwares');
    });
  }

  @override
  Widget build(BuildContext context) {
    //RECUPERAR o id do ALUNO que foi selecionado
    var id = ModalRoute.of(context)!.settings.arguments;
    if (id != null) {
      if (txtNumeroSala.text.isEmpty && txtSoftwares.text.isEmpty) {
        getDocumentoById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Salas'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade900,
      ),
      backgroundColor: Colors.grey[50],
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            campoTexto('numero da sala', txtNumeroSala, Icons.people),
            const SizedBox(height: 20),
            Texto('softwares', txtSoftwares, Icons.code),
            //const SizedBox(height: 20),
            //campoTexto('Codigo', txtCodigo, Icons.control_point),
            const SizedBox(height: 40),
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
                        FirebaseFirestore.instance.collection('salas').add(
                          {
                            'uid' : FirebaseAuth.instance.currentUser!.uid.toString(),
                            'numero da sala': txtNumeroSala.text,
                            'softwares': txtSoftwares.text,
                            //'codigo': txtCodigo.text,
                          },
                        );
                        sucesso(context, 'O item foi adicionado com sucesso.');
                      } else {
                        FirebaseFirestore.instance
                            .collection('salas')
                            .doc(id.toString())
                            .set(
                          {
                            'uid' : FirebaseAuth.instance.currentUser!.uid.toString(),
                            'numero da sala': txtNumeroSala.text,
                            'softwares': txtSoftwares.text,
                            //'codigo': txtCodigo.text,

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
    );
  }
}