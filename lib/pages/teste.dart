// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firebase Dropdown Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: FirebaseDropdownScreen(),
//     );
//   }
// }

// class FirebaseDropdownScreen extends StatefulWidget {
//   @override
//   _FirebaseDropdownScreenState createState() => _FirebaseDropdownScreenState();
// }

// class _FirebaseDropdownScreenState extends State<FirebaseDropdownScreen> {
//   String _selectedItem;

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference itemsRef = FirebaseFirestore.instance.collection('items');
//     CollectionReference selectedItemsRef = FirebaseFirestore.instance.collection('selectedItems');

//     Stream<QuerySnapshot> itemsStream = itemsRef.snapshots();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firebase Dropdown Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             StreamBuilder<QuerySnapshot>(
//               stream: itemsStream,
//               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasError) {
//                   return Text('Erro ao carregar os itens');
//                 }

//                 if (!snapshot.hasData) {
//                   return Text('Carregando os itens...');
//                 }

//                 List<DropdownMenuItem<String>> dropdownItems = snapshot.data.docs.map((DocumentSnapshot document) {
//                   return DropdownMenuItem(
//                     value: document.id,
//                     child: Text(document.data()['name']),
//                   );
//                 }).toList();

//                 return DropdownButton(
//                   value: _selectedItem,
//                   items: dropdownItems,
//                   onChanged: (String value) {
//                     setState(() {
//                       _selectedItem = value;
//                     });

//                     selectedItemsRef.doc(value).set({
//                       'name': value,
//                     });
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Switch Demo',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   bool _value = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Switch Demo'),
//       ),
//       body: Center(
//         child: Switch(
//           value: _value,
//           onChanged: (bool newValue) {
//             setState(() {
//               _value = newValue;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }


// children: [
//             Switch(
//               value: _value,
//               onChanged: (bool newValue) {
//                 setState(() {
//                   _value = newValue;
//                 });
//               },
//             ),
//             Text(
//               'Habilitar recurso',
//               style: TextStyle(fontSize: 18.0),
//             ),
//           ],




//    criaDropDownButton() {
//       return Container(
//         child: Column(
//           children: <Widget>[
             
//             DropdownButton<String>(
//               items : namesList.map((String dropDownStringItem) {
//                 return DropdownMenuItem<String>(
//                   value: dropDownStringItem,
//                   child: Text(dropDownStringItem),
//                  );
//              }).toList(),
//               onChanged: ( String novoItemSelecionado) {
//                 _dropDownItemSelected(novoItemSelecionado);
//                 setState(() {
//                  this._itemSelecionado =  novoItemSelecionado;
//                 });
//               },
//               value: _itemSelecionado
//             ),
//             Text("A cidade selecionada foi \n$_itemSelecionado",
//                style: TextStyle(fontSize: 20.0),
//              ),
//           ],
//          ),
//        );
//     }

//  void _dropDownItemSelected(String novoItem){
//         setState(() {
//         this._itemSelecionado = novoItem;
//         });
//     }

  // DropdownButton<String>(
            //   items: [
            //     DropdownMenuItem<String>(
            //       child: Text('Exporadica'),
            //       value: 'Exporadica',
            //     ),
            //     DropdownMenuItem<String>(
            //       child: Text('Semestral'),
            //       value: 'Exporadica',
            //     ),
            //   ],
            //   onChanged: (String? value) {
            //     setState(() {
            //       _value = value;
            //     });
            //   },
            //   hint: Text('Select Item'),
            //   value: _value,
            // ),

//print("LISTA----> $_lista");
   
   //String? opcaoSelecionada;
   //List<String> opcoes = ['Opção 1', 'Opção 2', 'Opção 3'];


  //  Widget build(BuildContext context) {
  //   // Recupere a coleção do Firestore que contém os documentos que você deseja
  //   CollectionReference minhaColecao = FirebaseFirestore.instance.collection('professores');

  //   return StreamBuilder<QuerySnapshot>(
  //     stream: minhaColecao.snapshots(),
  //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //       if (snapshot.hasError) {
  //         return Text('Erro ao recuperar documentos: ${snapshot.error}');
  //       }

  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Text('Carregando...');
  //       }

  //       // Para cada documento na coleção, adicione-o à lista
  //       minhaLista = snapshot.data.docs;

  //       // Agora, você pode usar a lista de documentos armazenados na variável minhaLista
  //       return ListView.builder(
  //         itemCount: minhaLista.length,
  //         itemBuilder: (BuildContext context, int index) {
  //           return ListTile(
  //             title: Text(minhaLista[index].data()['nome']),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  //Stream<QuerySnapshot> _stream = FirebaseFirestore.instance
  //.collection('salas')
  //.snapshots();

  //var opcaoSelecionada2 = opcaoSelecionada;

  
//   Future<List<String>> getCollectionNames() async {
//   QuerySnapshot querySnapshot = await firestore.collection('professores').get();
//   List<String> namesList = [];
//   querySnapshot.docs.forEach((document) {
//     String name = document.get('name');
//     namesList.add(name);
//   });
//   return namesList;
// }


/*

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TabelaFirebase extends StatefulWidget {
  @override
  _TabelaFirebaseState createState() => _TabelaFirebaseState();
}

class _TabelaFirebaseState extends State<TabelaFirebase> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  List<DataRow> _dadosTabela = [];

  @override
  void initState() {
    super.initState();
    _recuperarDados();
  }

  void _recuperarDados() async {
    QuerySnapshot snapshot =
        await _db.collection('minhaColecao').get(); //Recuperando documentos da coleção 'minhaColecao'

    List<DataRow> listaLinhas = [];

    snapshot.docs.forEach((document) {
      String campo1 = document.data()['campo1'];
      String campo2 = document.data()['campo2'];
      String campo3 = document.data()['campo3'];

      listaLinhas.add(
        DataRow(
          cells: [
            DataCell(Text(campo1)),
            DataCell(Text(campo2)),
            DataCell(Text(campo3)),
          ],
        ),
      );
    });

    setState(() {
      _dadosTabela = listaLinhas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabela Firebase'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(label: Text('Campo 1')),
            DataColumn(label: Text('Campo 2')),
            DataColumn(label: Text('Campo 3')),
          ],
          rows: _dadosTabela,
        ),
      ),
    );
  }
}







*/
                      
                          //   subtitle: Text(
                          //     'nome: ${lista2[index].nome} / email: ${lista2[index].email}', // codigo: ${lista2[index].codigo} / 
                          //     style: const TextStyle(fontSize: 18),
                          //   ),
                          //   trailing: IconButton(
                          //     icon: const Icon(Icons.delete_outline),
                          //     onPressed: () {
                          //       FirebaseFirestore.instance
                          //           .collection("professores").doc(lista2[index].id).delete();
                          //       sucesso(context,'O documento foi apagado com sucesso.');
                          //     },
                          //   ),
                          //   onTap: () {
                          //   Navigator.pushNamed(
                          //     context,
                          //     'tela_cadastro_professores',
                          //     arguments: lista2[index].id,
                          //   );
                          // },

// class Botao extends StatelessWidget {
  
//   final String text;
//   const Botao({ Key? key ,required this.text}) : super(key: key);


//   @override
//   Widget build(BuildContext context) {
    
//     return AlertDialog(
          
//           title: const Text('Dias de cadastro'),
//           //centerTitle: true,
          
//           content: Column(
//             children: [
//                Text(
//               text,
//               style: const TextStyle(fontSize: 24),
//             ),

//               ListTile(
//                 title: const Text('Lafayette'),
//                 leading: Radio<SingingCharacter>(
//                   value: SingingCharacter.lafayette,
//                   groupValue: _character,
//                   onChanged: (SingingCharacter? value) {
//                     setState(() {
//                       _character = value;
//                     });
//                   },
//                 ),
//               ),
//               ListTile(
//                 title: const Text('Thomas Jefferson'),
//                 leading: Radio<SingingCharacter>(
//                   value: SingingCharacter.jefferson,
//                   groupValue: _character,
//                   onChanged: (SingingCharacter? value) {
//                     setState(() {
//                       _character = value;
//                     });
//                   },
//                 ),
//               ),

//           ],
//           ),
//           actions: [
            
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('fechar')),
//           ],
//         );
//       }
//   }                            
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CSVFireStore',
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<dynamic>> _data = [];

  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("lib/data/COMPLETO.csv");
    List<List<dynamic>> _listData = const CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
      for(int i = 1; i < _listData.length; i++){
        FirebaseFirestore.instance.collection('produtos').add({
          'codigo': _listData[i][0].toString(),
          'descricao': _listData[i][1].toString(),
          'itens_cfop': _listData[i][2].toString(),
          'itens_ncm': _listData[i][3].toString(),
          'itens_sittrib': _listData[i][4].toString(),
          'itens_sit': _listData[i][5].toString(),
          'itens_poraliquota': _listData[i][6].toString(),
          'itens_cest': _listData[i][7].toString(),
          'valor': _listData[i][8].toString()
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
}*/