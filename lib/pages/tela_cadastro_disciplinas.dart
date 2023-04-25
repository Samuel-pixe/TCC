import 'package:app_tcc/pages/widgets/botao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets/campo_texto.dart';
import 'widgets/mensagem.dart';

class TelaCadastroDisciplinas extends StatefulWidget {
  const TelaCadastroDisciplinas({Key? key}) : super(key: key);

  @override
  _TelaCadastroDisciplinasState createState() => _TelaCadastroDisciplinasState();
}

class _TelaCadastroDisciplinasState extends State<TelaCadastroDisciplinas> {
  var txtDisc = TextEditingController();
  var txtCodigo = TextEditingController();

  //
  // getDocumentoById
  //
  getDocumentoById(id) async {
    await FirebaseFirestore.instance
        .collection('disciplina')
        .doc(id)
        .get()
        .then((doc) {
      txtDisc.text = doc.get('disciplina');
      //txtCodigo.text=doc.get('codigo');
    });
  }

  @override
  Widget build(BuildContext context) {
    //RECUPERAR o id do ALUNO que foi selecionado
    var id = ModalRoute.of(context)!.settings.arguments;
    if (id != null) {
      if (txtDisc.text.isEmpty && txtCodigo.text.isEmpty) {
        getDocumentoById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
        color: Colors.black, // Defina a cor que deseja usar
        ),
        title: const Text('Cadastro de Disciplinas',
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
            campoTexto('Disciplina', txtDisc, Icons.text_snippet_outlined),
            const SizedBox(height: 20),
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
                        FirebaseFirestore.instance.collection('disciplina').add(
                          {
                            'uid' : FirebaseAuth.instance.currentUser!.uid.toString(),
                            'disciplina': txtDisc.text,
                            //'codigo': txtCodigo.text,
                          },
                        );
                        sucesso(context, 'O item foi adicionado com sucesso.');
                      } else {
                        FirebaseFirestore.instance
                            .collection('disciplina')
                            .doc(id.toString())
                            .set(
                          {
                            'uid' : FirebaseAuth.instance.currentUser!.uid.toString(),
                            'disciplina': txtDisc.text,
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
            
      ),
    );
  }
}