
import 'package:app_tcc/pages/widgets/mensagem.dart';
import 'package:app_tcc/pages/widgets/sobre.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/reserva.dart';
import 'package:google_fonts/google_fonts.dart';



class TelaHome extends StatefulWidget {
  const TelaHome({ Key? key }) : super(key: key);

  @override
  State<TelaHome> createState() => _TelaHomeState();
}


class _TelaHomeState extends State<TelaHome> {
//----------------------------------------//

List<Reserva> listaReserva = [];
List<Reserva> listaReserva2 = [];


var form = GlobalKey<FormState>();
var nomeUsuario;
var emailUsuario;

  loadReservaData() async {
      await FirebaseFirestore.instance.collection('reserva').get().then((q) {
        listaReserva.clear();
        listaReserva2.clear();
        for (var d in q.docs) {
          listaReserva.add(Reserva.fromJson(d.id, d.data()));
          print(d.data().toString());
        }
        listaReserva2.addAll(listaReserva);
      });
    
  }
  /*
  carregarDados() async {
    if (txtPesquisar.text.isEmpty) {
      await FirebaseFirestore.instance.collection('alunos').get().then((q) {
        lista1.clear();
        lista2.clear();
        for (var d in q.docs) {
          lista1.add(Alunos.fromJson(d.id, d.data()));
          //print(d.data().toString());
        }
        lista2.addAll(lista1);
      });
    }
  }*/



  @override
  Widget build (BuildContext context) {
    return Scaffold(
      //----------------------//
        drawer: Drawer(
        child: Column(
          children: [
            // UserAccountsDrawerHeader(
            //   accountName: Text("teste"), 
            //   accountEmail: Text("teste@gmail.com"),
            //   ),
            ListTile(
              
              leading: Icon(Icons.menu, color: Colors.white,),
              title: Text('Menu',style: TextStyle(color: Colors.white,),),
              subtitle: Text(style: TextStyle(color: Colors.white,),'Consulta'),
              tileColor: Color.fromARGB(255, 2, 50, 97) // define a cor de fundo do ListTileR=0, G=12, B=24
              
            ),
            const Divider(
                height: 0.5,
                thickness: 3,
                indent: 0,
                endIndent: 0,
                color: Colors.white,
              ),
            ListTile(
              title: Text(
              style: TextStyle(color: Colors.white,),'Consulta de Alunos'),
              tileColor: Color.fromARGB(255, 2, 50, 97), // define a cor de fundo do ListTile
              onTap:() {
                Navigator.pushNamed(context, 'tela_alunos_pesquisa');
              },
            ),
            ListTile(
              title: Text(
                style: TextStyle(color: Colors.white,),'Consulta de Professores'),
              tileColor: Color.fromARGB(255, 2, 50, 97), // define a cor de fundo do ListTile
              onTap:() {
                Navigator.pushNamed(context, 'tela_professores_pesquisa');
              },
            ),
            ListTile(
              title: Text(
                style: TextStyle(color: Colors.white,),'Consulta de Ramais'),
              tileColor: Color.fromARGB(255, 2, 50, 97), // define a cor de fundo do ListTile
              onTap:() {
                Navigator.pushNamed(context, 'tela_ramais');
              },
            ),
            Divider(
                height: 2,
                thickness: 3,
                indent: 0,
                endIndent: 0,
                color: Colors.white,
              ),    
            ListTile(
              
              leading: Icon(Icons.upload, color: Colors.white,),
              title: Text('Menu',style: TextStyle(color: Colors.white,),),
              subtitle: Text(style: TextStyle(color: Colors.white,),'Cadastro'),
              tileColor: Color.fromARGB(255, 2, 50, 97) // define a cor de fundo do ListTileR=0, G=12, B=24
              
            ),

            Divider(
                height: 2,
                thickness: 3,
                indent: 0,
                endIndent: 0,
                color: Colors.white,
              ),
            ListTile(
              title: Text(
              style: TextStyle(color: Colors.white,),'Cadastro de Alunos'),
              tileColor: Color.fromARGB(255, 2, 50, 97), // define a cor de fundo do ListTile
              onTap:() {
                Navigator.pushNamed(context, 'tela_cadastro_alunos');
              },
            ),
            ListTile(
              title: Text(
              style: TextStyle(color: Colors.white,),'Cadastro de Professores'),
              tileColor: Color.fromARGB(255, 2, 50, 97), // define a cor de fundo do ListTile
              onTap:() {
                Navigator.pushNamed(context, 'tela_cadastro_professores');
              },
            ),
            ListTile(
              title: Text(
              style: TextStyle(color: Colors.white,),'Cadastro de Reservas'),
              tileColor: Color.fromARGB(255, 2, 50, 97), // define a cor de fundo do ListTile
              onTap:() {
                Navigator.pushNamed(context, 'tela_cadastro_de_reserva');
              },
            ),
            ListTile(
              title: Text(
              style: TextStyle(color: Colors.white,),'Cadastro de Ramais'),
              tileColor: Color.fromARGB(255, 2, 50, 97), // define a cor de fundo do ListTile
              onTap:() {
                Navigator.pushNamed(context, 'tela_cadastro_ramal');
              },
            ),

            ListTile(
              title: Text(
              style: TextStyle(color: Colors.white,),'Cadastro de Salas'),
              tileColor: Color.fromARGB(255, 2, 50, 97), // define a cor de fundo do ListTile
              onTap:() {
                Navigator.pushNamed(context, 'tela_cadastro_de_salas');
              },
            ),
            ListTile(
              title: Text(
              style: TextStyle(color: Colors.white,),'Cadastro de Disciplinas'),
              tileColor: Color.fromARGB(255, 2, 50, 97), // define a cor de fundo do ListTile
              onTap:() {
                Navigator.pushNamed(context, 'tela_cadastro_disciplinas');
              },
            ),
            
          ],
        )
      ),
      
      //-------------------------------------

      appBar: AppBar(  
       
      iconTheme: IconThemeData(
        color: Colors.black, // Defina a cor que deseja usar
      ),   
      title: const Text('Sysliape',
         style: TextStyle(
              fontFamily: 'GoogleFonts.lato',
              fontStyle: FontStyle.italic,
              fontSize: 45,
              fontWeight: FontWeight.w900,
              color: Colors.black,
              //Color.fromARGB(255, 20, 20, 20)
            ),
      ),
        centerTitle: true,
        
        backgroundColor: Colors.grey.shade300, actions: [
          Column(
            children: [
              IconButton(
                tooltip: 'sair',
                onPressed: () {
                FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, 'login');
                },
                  icon: const Icon(Icons.logout),
                ),
                FutureBuilder(
                future: retornarNomeUsuario(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const CircularProgressIndicator();
                  } else {
                    return Text(
                      nomeUsuario.toString(),
                      style: const TextStyle(fontSize: 12),
                    );
                  }
                },
              ),
              //IconButton(onPressed: () {
              //caixaDialogoSobre('Tema do App: Controle e cadastro de alunos no banco de dados\nObjetivo: Criar um aplicativo para poder fazer o cadastro de alunos no banco de dados para acessar a rede wifi\nSamuel Arantes Gonzales');  
              //},icon: const Icon(Icons.info_outline))//question_mark_rounded
            ],
          ),          
        ],
        
        //------------------//
      ),
      
      
      backgroundColor: Colors.grey.shade200,
      //body: SingleChildScrollView(
        body: Container(
          
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [Colors.grey.shade700, Colors.grey.shade100],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //   ),
          //   //color: Colors.grey.shade200,
          //   borderRadius: BorderRadius.circular(3),
          //   border: Border.all(
          //     color: Colors.black,
          //     width: 1,
          //   ),
          // ),
          
          padding: const EdgeInsets.all(10),
          child: Center(
            //------------------------------------- FORMULÁRIO----------------------------------//        
            child: Form(
              key: form,
              child: Column(
                children: [
                const Divider(
                    height: 0.5,
                    thickness: 3,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                Container(
                color: Colors.grey.shade300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [  
                                     
                    Center(
                        //color: Colors.red,
                        child: Icon(
                          Icons.people_alt,//people_alt //article
                          size: 100,
                          color: Colors.grey.shade500,
                        ),
                      ), 
                    ],
                    
                  ),
                ),
                 
                  // Expanded(
                  //   flex: 1,
                  //   child: Text(  
                  //     'Título',
                  //     style: GoogleFonts.lato(
                  //       fontSize: 24,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  //botao1("teste"),
                  //Center(),
                  /*
                  const Divider(
                    height: 0.5,
                    thickness: 3,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.black,
                  ),*/
                  Text(
                    'Aulas Cadastradas',
                    style: GoogleFonts.lato(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Divider(
                    height: 0.5,
                    thickness: 3,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.black,
                  ),

                  botao1("teste"),
                  
                  Expanded(
                    //flex: 6,
                    child: FutureBuilder(
                      future: loadReservaData(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                              return ListView.builder(
                                itemCount: listaReserva2.length,
                                  itemBuilder: (context, index) { 
                                    return ListTile(
                                      title: Text(
                                        textAlign: TextAlign.center,
                                        listaReserva2[index].sala,
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                      subtitle: Text(
                                        textAlign: TextAlign.center,
                                        'Professor: ${listaReserva2[index].professor}',
                                        style: const TextStyle(fontSize: 5),
                                      ),
                                      
                                       trailing: IconButton(
                                         icon: const Icon(Icons.delete_outline),
                                         onPressed: () {
                                           FirebaseFirestore.instance
                                              .collection("reserva").doc(listaReserva2[index].id).delete();
                                           sucesso(context,'O documento foi apagado com sucesso.');
                                         },
                                       ),
                                       onTap: () {
                                         Navigator.pushNamed(
                                           context,
                                           'tela_cadastro_de_reserva',
                                           arguments: listaReserva2[index].id,
                                         );
                                       },
                                    );

                                },
                              );
                            }else {
                            return const Center(child: CircularProgressIndicator());
                          }                      
                      }
                    ),
                  ),
                  


                ]),
              
            ),
          ),
          
        ),
        
      //),
    );
   }

  //----------------------------------//

  botao1(rotulo) {
  return SizedBox(width: 190,height: 45,

      child: ElevatedButton(//TextButton
        onPressed: () {
          //loadReservaData();
          print(listaReserva2);

        },
        //aparência
        child: Text(rotulo,style: const TextStyle(fontSize: 14),),style: ElevatedButton.styleFrom(primary: Colors.grey.shade900,),
      ),
    );
  }

  //----------------------------------//

  botao2(rotulo) {
  return SizedBox(
    width: 190,height: 45,
    
      child: ElevatedButton(//TextButton
        onPressed: () {
         Navigator.pushNamed(context, 'tela_cadastro_alunos');

        },
        //aparência
        child: Text(rotulo,style: const TextStyle(fontSize: 14),),style: ElevatedButton.styleFrom(primary: Colors.grey.shade900,),
      ),
    );
  }
  //-----------------------------------//
  botao3(rotulo) {
  return SizedBox(width: 190,height: 45,

      child: ElevatedButton(//TextButton
        onPressed: () {
         Navigator.pushNamed(context, 'tela_professores_pesquisa');

        },
        //aparência
        child: Text(rotulo, style: const TextStyle(fontSize: 14),),style: ElevatedButton.styleFrom(primary: Colors.grey.shade900,),
      ),
    );
  }


  
  //----------------------------------//

  botao4(rotulo) {
  return SizedBox(width: 190,height: 45,

      child: ElevatedButton(//TextButton
        onPressed: () {
         Navigator.pushNamed(context, 'tela_cadastro_professores');

        },
        //aparência
        child: Text(rotulo, style: const TextStyle(fontSize: 14),),style: ElevatedButton.styleFrom(primary: Colors.grey.shade900,),
      ),
    );
  }

  //----------------------------------//

  botao5(rotulo) {
  return SizedBox(width: 190,height: 45,

      child: ElevatedButton(//TextButton
        onPressed: () {
          Navigator.pushNamed(context, 'tela_reservas');

        },
        //aparência
        child: Text(rotulo,style: const TextStyle(fontSize: 14),),style: ElevatedButton.styleFrom(primary: Colors.grey.shade900,),
      ),
    );
  }

  //----------------------------------//
  
  botao6(rotulo) {
  return SizedBox(width: 190,height: 45,

      child: ElevatedButton(//TextButton
        onPressed: () {
          Navigator.pushNamed(context, 'tela_perfil');
          //Navigator.pushNamed(context,'tela_perfil',arguments: listaReserva2[index].id,);

        },
        //aparência
        child: Text(rotulo,style: const TextStyle(fontSize: 14),),style: ElevatedButton.styleFrom(primary: Colors.grey.shade900,),
      ),
    );
  }

  //----------------------------------//

  botao7(rotulo) {
  return SizedBox(width: 190,height: 45,

      child: ElevatedButton(//TextButton
        onPressed: () {
          Navigator.pushNamed(context, 'tela_ramais');

        },
        //aparência
        child: Text(rotulo,style: const TextStyle(fontSize: 14),),style: ElevatedButton.styleFrom(primary: Colors.grey.shade900,),
      ),
    );
  }

  caixaDialogoSobre(msg) {
    return showDialog(
      context: context,
      
      builder: (BuildContext context) {
      return Sobre(text: msg);
      },
    );
  }

  retornarNomeUsuario() async {
    var uid = FirebaseAuth.instance.currentUser!.uid.toString();
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: uid)
        .get()
        .then((q) {
      if (q.docs.isNotEmpty) {
        nomeUsuario = q.docs[0].data()['nome'];
        //emailUsuario = q.docs[0].data()['email'];
      } else {
        nomeUsuario = 'NENHUM';
      }
    });
  }



}
