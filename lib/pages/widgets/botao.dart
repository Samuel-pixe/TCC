// import 'package:flutter/material.dart';

// class MyDialog extends StatefulWidget {
//   @override
//   _MyDialogState createState() => _MyDialogState();
// }

// class _MyDialogState extends State<MyDialog> {
//   int _radioValue = 0;
//   List<bool> _checkBoxValues = List.generate(20, (index) => false);

//   void _handleRadioValueChange(int value) {
//     setState(() {
//       _radioValue = value;
//     });
//   }

//   void _handleCheckBoxValueChange(int index, bool value) {
//     setState(() {
//       _checkBoxValues[index] = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Opções'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text('Escolha uma opção:'),
//           RadioListTile(
//             title: Text('Opção 1'),
//             value: 1,
//             groupValue: _radioValue,
//             onChanged: _handleRadioValueChange,
//           ),
//           RadioListTile(
//             title: Text('Opção 2'),
//             value: 2,
//             groupValue: _radioValue,
//             onChanged: _handleRadioValueChange,
//           ),
//           RadioListTile(
//             title: Text('Opção 3'),
//             value: 3,
//             groupValue: _radioValue,
//             onChanged: _handleRadioValueChange,
//           ),
//           RadioListTile(
//             title: Text('Opção 4'),
//             value: 4,
//             groupValue: _radioValue,
//             onChanged: _handleRadioValueChange,
//           ),
//           RadioListTile(
//             title: Text('Opção 5'),
//             value: 5,
//             groupValue: _radioValue,
//             onChanged: _handleRadioValueChange,
//           ),
//           RadioListTile(
//             title: Text('Opção 6'),
//             value: 6,
//             groupValue: _radioValue,
//             onChanged: _handleRadioValueChange,
//           ),
//           RadioListTile(
//             title: Text('Opção 7'),
//             value: 7,
//             groupValue: _radioValue,
//             onChanged: _handleRadioValueChange,
//           ),
//           SizedBox(height: 16),
//           Text('Escolha as opções desejadas:'),
//           Expanded(
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: 20,
//               itemBuilder: (BuildContext context, int index) {
//                 return CheckboxListTile(
//                   title: Text('Opção ${index + 1}'),
//                   value: _checkBoxValues[index],
//                   onChanged: (bool value) {
//                     _handleCheckBoxValueChange(index, value);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       actions: [
//         FlatButton(
//           onPressed: () {
//             Navigator.pop(context, {'radioValue': _radioValue, 'checkBoxValues': _checkBoxValues});
//           },
//           child: Text('OK'),
//         ),
//         FlatButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Cancelar'),
//         ),
//       ],
//     );
//   }
// }
