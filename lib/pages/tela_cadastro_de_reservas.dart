import 'package:app_tcc/model/disciplina.dart';
import 'package:app_tcc/model/professores.dart';
//import 'package:app_tcc/pages/widgets/horarios.dart';
//import 'package:app_tcc/pages/widgets/dropdown.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:app_tcc/pages/widgets/textFieldsuggestion.dart';
import 'package:app_tcc/pages/widgets/texto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/salas.dart';
import 'widgets/campo_texto.dart';
import 'widgets/mensagem.dart';

class TelaReservaDeSalas extends StatefulWidget {
  const TelaReservaDeSalas({Key? key}) : super(key: key);

  @override
  _TelaReservaDeSalasState createState() => _TelaReservaDeSalasState();
}

class _TelaReservaDeSalasState extends State<TelaReservaDeSalas> {
  
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  bool _isChecked5 = false;
  bool _isChecked6 = false;
  bool _isChecked7 = false;
  
 var txtHora1 = TextEditingController();
 var txtHora2 = TextEditingController();
  
  //String valor = _controller.text;

  TextEditingController _controller = TextEditingController();
  
  CollectionReference colecaoStream = FirebaseFirestore.instance.collection('professores');
  CollectionReference colecaoStream2 = FirebaseFirestore.instance.collection('salas');
  CollectionReference colecaoStream3 = FirebaseFirestore.instance.collection('disciplina');
  
  String TipoAula = "Semestral";
  String salas = "";
  String professor = "";
  String disciplina = "";
  String dia = "";

  List<Professores> lista = [];
  List<String> _lista = [];

  List<Salas> lista2 = [];
  List<String> _lista2 = [];

  List<Disciplina> lista3 = [];
  List<String> _lista3 = [];

  List<bool> _checkboxValues = [false, false, false, false,false, false, false];
  String _selectedCheckboxes = '';


  var txtSala = TextEditingController();
  var txtOBS = TextEditingController();

  String? _value;
  String? _value2;

   
  bool _aula = false;
  //List<DocumentSnapshot> minhaLista = [];
  
   //String _aula="";
   //var _tipoAula =['Exporadica','Semestral'];
   //var _itemSelecionado = 'Exporadica';


  getDocumentoById(id) async {
    await FirebaseFirestore.instance
        .collection('reserva')
        .doc(id)
        .get()
        .then((doc) {
      //txtSala.text = doc.get('sala');
      professor = doc.get('professor');
      salas = doc.get('sala');
      disciplina = doc.get('disciplina');
      txtOBS.text = doc.get('observacao');
      TipoAula = doc.get('tipo');
      dia = doc.get("dia");
      
    });
  }
  

  getProfessores() async {
    QuerySnapshot qS = await colecaoStream.get();
    for (DocumentSnapshot p in qS.docs) {
      Professores prof = Professores.fromJson(p.data() as Map<String, dynamic>, p.id);
      lista.add(prof);
    } 
    setState(() {
      _lista = lista.map((profe) => profe.nome).toList();
    });        
  }

  getSalas() async {
    QuerySnapshot qS = await colecaoStream2.get();
    for (DocumentSnapshot p in qS.docs) {
      Salas sla = Salas.fromJson(p.data() as Map<String, dynamic>, p.id);
      lista2.add(sla);
    }
    setState(() {
      _lista2 = lista2.map((sala) => sala.numeroSala).toList();
    });     
  }

  getDisciplinas() async {
    QuerySnapshot qS = await colecaoStream3.get();
    for (DocumentSnapshot p in qS.docs) {
      Disciplina dis = Disciplina.fromJson(p.data() as Map<String, dynamic>, p.id);
      lista3.add(dis);
    }
    setState(() {
      _lista3 = lista3.map((disciplinas) => disciplinas.nomeDisciplina).toList();
    });     
  }

  

  void initState() {
    super.initState();
    getProfessores();
    getSalas();
    getDisciplinas();
  }
  
  // void _SetDay() {
  // String checkedDays = "";
  //  for (int i = 0; i < _checkboxValues.length; i++) {
  //   if (_checkboxValues[0]==true) {
  //     checkedDays =(checkedDays+"Segunda-feira");
  //   }
  //   if (_checkboxValues[1]==true) {
  //     checkedDays =(checkedDays+"Terça-feira");
  //   }
  //   if (_checkboxValues[2]==true) {
  //     checkedDays =(checkedDays+"Quarta-feira");
  //   }
  //   if (_checkboxValues[3]==true) {
  //     checkedDays =(checkedDays+"Quinta-feira");
  //   }
  //   if (_checkboxValues[4]==true) {
  //     checkedDays =(checkedDays+"Sexta-feira");
  //   }
  //   if (_checkboxValues[5]==true) {
  //     checkedDays =(checkedDays+"Sabado");
  //   }
  //   if (_checkboxValues[6]==true) {
  //     checkedDays =(checkedDays+"Domingo");
  //   }
  // }
  // }

 String _getCheckedDays() {
  String checkedDays = "";
  for (int i = 0; i < _checkboxValues.length; i++) {
    if (_checkboxValues[i]) {
      if (i == 0) {
        checkedDays += "Segunda-feira ";
      } else if (i == 1) {
        checkedDays += "Terça-feira ";
      } else if (i == 2) {
        checkedDays += "Quarta-feira ";
      } else if (i == 3) {
        checkedDays += "Quinta-feira ";
      } else if (i == 4) {
        checkedDays += "Sexta-feira ";
      } else if (i == 5) {
        checkedDays += "Sábado ";
      } else if (i == 6) {
        checkedDays += "Domingo ";
      }
    }
  }
  return checkedDays;
}





  
  @override
  Widget build(BuildContext context) { 
    //RECUPERAR o id da SALA que foi selecionado
    var id = ModalRoute.of(context)!.settings.arguments;
    if (id != null) {
      if (txtSala.text.isEmpty) {
        //print('##################' + id.toString());
        getDocumentoById(id);
      }
   }

  
    
  return Scaffold(
    
      appBar: AppBar(
        title: const Text('Cadastro de Salas',
        style: TextStyle(
              fontFamily: 'Roboto',
              fontStyle: FontStyle.italic,
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
        
        centerTitle: true,
        
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade300,
      ),
      
    
     body: Center(
      
       child: Container(
        width: 1100,
        height: 950,
        decoration: BoxDecoration(
          
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),

      padding: const EdgeInsets.all(50),

      child: ListView(
          children: [
            Center (
              child: Text(
                'Reservas',
                style: TextStyle(
                  
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            //--------------------
            const SizedBox(height: 20),
            //-------------------Professor
            TextFieldSuggestions(list: _lista, labelText: 'Professor',textSuggetionsColor: Colors.black,suggetionsBackgroundColor: Colors.white , outlineInputBorderColor:Colors.black ,returnedValue: (value)=>professor=value,onTap: (){},height: 450),
            const SizedBox(height: 10),
            //--------------------Salas
            TextFieldSuggestions(list: _lista2, labelText: 'Sala',textSuggetionsColor: Colors.black,suggetionsBackgroundColor: Colors.white , outlineInputBorderColor:Colors.black ,returnedValue: (value)=>salas=value,onTap: (){},height: 450),
            const SizedBox(height: 20),
            //-------------------Tipo de Reserva
            Texto('Sobre', txtOBS, Icons.assignment_outlined),
            const SizedBox(height: 20),

           /*OutlinedButton(
            
            style: OutlinedButton.styleFrom(
              
              primary: Colors.white,
              //fixedSize: Size(50, 45),
              minimumSize: const Size(200, 45),
              backgroundColor: Colors.grey.shade600
              ),
              child: const Text('TESTE'),
              
              onPressed: () {
                print(_checkboxValues);
              },
            ),
            */
            Row( 
              children: [ 
                Text(
                'Semestral',
                style: TextStyle(fontSize: 18.0),
              ),         
              Switch(
              value: _aula,
              onChanged: (bool newValue) {
                setState(() {
                  _aula = newValue;
                  if (_aula) {
                    // atribuir um valor se _aula for verdadeiro
                    TipoAula = "Exporadico";
                  } else {
                    // atribuir um valor se _aula for falso
                    TipoAula = "Semestral";
                  }
                });
              },
            ),
                Text(
                'Exporadica',
                style: TextStyle(fontSize: 18.0),
              ),
             ],
            ),
            //const SizedBox(height: 100),

            //--------------------------
              // TextField(
              //   controller: _controller,
              //   keyboardType: TextInputType.number,
              //   inputFormatters: [
              //     FilteringTextInputFormatter.allow(
              //         RegExp(r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$')),
              //   ],
              // ),

              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                    Expanded(
                        child:CheckboxListTile(
                        title: Text('Segunda-feira'),
                        value: _isChecked1,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked1 = value!;
                            _checkboxValues[0] = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child:CheckboxListTile(
                        title: Text('Terça-feira'),
                        value: _isChecked2,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked2 = value!;
                            _checkboxValues[1] = value;;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child:CheckboxListTile(
                        title: Text('Quarta-feira'),
                        value: _isChecked3,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked3 = value!;
                            _checkboxValues[2] = value;;
                          });
                        },
                      ),
                    ),
                    Expanded(
                     child:CheckboxListTile(
                        title: Text('Quinta-feira'),
                        value: _isChecked4,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked4 = value!;
                            _checkboxValues[3] = value;;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child:CheckboxListTile(
                        title: Text('Sexta-feira'),
                        value: _isChecked5,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked5 = value!;
                            _checkboxValues[4] = value;;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child:CheckboxListTile(
                        title: Text('Sábado'),
                        value: _isChecked6,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked6 = value!;
                            _checkboxValues[5] = value;;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child:CheckboxListTile(
                        title: Text('Domingo'),
                        value: _isChecked7,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked7 = value!;
                            _checkboxValues[6] = value;

                          });
                        },
                      ),
                    ),
                  ],
              ),
              
              const SizedBox(height: 20),
              campoTextoHora1('Inicio', txtHora1,Icons.timer_outlined),
              const SizedBox(height: 20),
              campoTextoHora1('Termino', txtHora2,Icons.timer_outlined),

              const SizedBox(height: 20),
              TextFieldSuggestions(list: _lista3, labelText: 'Disciplina',textSuggetionsColor: Colors.black,suggetionsBackgroundColor: Colors.white , outlineInputBorderColor:Colors.black ,returnedValue: (value)=>disciplina=value,onTap: (){},height: 450),
              const SizedBox(height: 10),
            // Column(
            //   children: [
            //     CheckboxListTile(
            //       title: Text('7:10'),
            //       value: _isChecked1,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           _isChecked1 = value!;
            //         });
            //       },
            //     ),
            //   ],
            // ),     
            
            //botao1("Horarios"),

            //--------------------------
            Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.grey.shade500,
                    ),
                    child: const Text('salvar'),
                    onPressed: () {
                      String dia = _getCheckedDays();
                      if (id == null) {
                        FirebaseFirestore.instance.collection('reserva').add(
                          {
                            'uid' : FirebaseAuth.instance.currentUser!.uid.toString(),
                            'professor': professor, 
                            'sala': ("Sala " + salas),
                            'tipo': TipoAula,
                            'observacao': txtOBS.text,
                            'inicio': txtHora1.text,
                            'termino':txtHora2.text,
                            'disciplina': disciplina,
                            'dia':dia,
                            //'professor':  
                          },
                        );
                        sucesso(context, 'O item foi adicionado com sucesso.');
                      } else {
                        FirebaseFirestore.instance
                            .collection('reserva')
                            .doc(id.toString())
                            .set(
                          {
                            'uid' : FirebaseAuth.instance.currentUser!.uid.toString(),
                            'professor': professor, 
                            'sala': ("Sala " + salas),
                            'tipo': TipoAula,
                            'observacao': txtOBS.text,
                            'inicio': txtHora1,
                            'termino':txtHora2,
                            'disciplina': disciplina,
                            'dia': dia,
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
//----------------------------
       )
      )  
    ); 
  
  
  }

// botao1(rotulo) {
  
//   return SizedBox(
//     width: 10,height: 20,
//       child: ElevatedButton(
//         //TextButton
        
//         onPressed: () {
//           AlertDialog(
//             title: const Text('Sobre - App'),
//             content: Column(
//               children: [
//                 const Text(text,style: TextStyle(fontSize: 24),),
//                 const SizedBox(height: 30,),
//                 //Image.network('assets/lib/imagens/foto.jpg',scale:1.8),
              
//                 ],
//             ),
//           );
//           //loadReservaData();
//           //print(listaReserva2);

//         },style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade600,),
//         //aparência
//         child: Text(rotulo,style: const TextStyle(fontSize: 14),),
//       ),
//     );
//   }

campoTextoHora1(rotulo, variavel, icone){
  return TextFormField(
      
      inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,HoraInputFormatter(),
      ],    

      //Associar a variável de controle
      controller: variavel,style: TextStyle(fontSize: 22,color: Colors.grey.shade900,),
      keyboardType: TextInputType.text,
     
      //obscureText: (senha==null)?false:true,//Senha
      //maxLength: 100,//Quant. máxima de caracteres

      decoration: InputDecoration(
      prefixIcon: Icon(icone, color: Colors.grey.shade900),
      prefixIconColor: Colors.grey.shade900,
      labelText: rotulo,
      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade600,),
      hintText:'',
      hintStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,), 
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),),
      ),
      
      //--------- Validação da entrada do usuário----------//
      
      validator: (value) {
        value = value!.replaceFirst(',', '.');
        //verificar se o usuário digitou um valor
        //numérico ->(double.tryParse(value) == null) 
        if (value.isEmpty){
          return 'Nenhum valor registrado';
        } else {
          return null;
        }
     },
    //),
  );
}
campoTextoHora2(rotulo, variavel, icone){
  return TextFormField(
      
      inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,HoraInputFormatter(),
      ],    

      //Associar a variável de controle
      controller: variavel,style: TextStyle(
      fontSize: 22,color: Colors.grey.shade900,
      ),
      keyboardType: TextInputType.text,
     
      //obscureText: (senha==null)?false:true,//Senha
      //maxLength: 100,//Quant. máxima de caracteres

      decoration: InputDecoration(
      prefixIcon: Icon(icone, color: Colors.grey.shade900),
      prefixIconColor: Colors.grey.shade900,
      labelText: rotulo,
      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade600,),
      hintText:'',
      hintStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,), 
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),),
      ),
      
      //--------- Validação da entrada do usuário----------//
      
      validator: (value) {
        value = value!.replaceFirst(',', '.');
        //verificar se o usuário digitou um valor
        //numérico ->(double.tryParse(value) == null) 
        if (value.isEmpty){
          return 'Nenhum valor registrado';
        } else {
          return null;
        }
     },
    //),
  );
}

}