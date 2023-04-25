class Reserva{
  String id;
  String sala;
  String professor;
  String tipo;
  String observacao;
  String dia;
  String horaInicio;
  String horaTermino;
  String disciplina;

  
  Reserva(this.id, this.sala, this.professor, this.tipo, this.observacao, this.dia, this.horaInicio, this.horaTermino, this.disciplina);

  factory Reserva.fromJson(String id,Map<String, dynamic> json){
    return Reserva(
        id,
        json["sala"],
        json["professor"], 
        json["tipo"],
        json["observacao"],  
        json["horaInicio"],
        json["horaTermino"],
        json["disciplina"],
        json["dia"],
     );
  }
}


 
                            
                           