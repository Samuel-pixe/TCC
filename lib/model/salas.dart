class Salas {
  String? id;
  String numeroSala;
  //String curso;
  String softwares;
  //String codigo;
  

  Salas({this.id, required this.numeroSala, required this.softwares});

  //Transformar dados no formato JSON em um objeto
  //da classe Pais
  factory Salas.fromJson(Map<String, dynamic> json, String id,) {
    return Salas(
        id : id,
        numeroSala: json["numero da sala"],
        //json["curso"],
        softwares: json["softwares"],
       // json["codigo"]
        );
  }
}
