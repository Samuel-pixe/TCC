import 'package:flutter/material.dart';

class HorariosList extends StatefulWidget {
  @override
  _HorariosListState createState() => _HorariosListState();
}

class _HorariosListState extends State<HorariosList> {
  List<String> horariosDisponiveis = [    '7:10',    '8:00',    '8:50',    '9:40',    '10:30',    '11:20',    '12:10',    '13:00',    '13:50',    '14:40',    '15:30',    '16:20',    '17:10',    '18:00',    '18:50',    '19:40',    '20:30',    '21:20',    '22:10',    '22:30'  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: horariosDisponiveis.length,
      itemBuilder: (context, index) {
        final horario = horariosDisponiveis[index];
        return ListTile(
          title: Text(horario),
          trailing: ElevatedButton(
            onPressed: () {
              setState(() {
                // Define o estado do botão como indisponível
                horariosDisponiveis[index] = 'Indisponível';
              });
            },
            child: Text('Selecionar'),
          ),
        );
      },
    );
  }
}