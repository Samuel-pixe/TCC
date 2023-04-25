class Disciplina {
  String? id;
  String nomeDisciplina;
  
  //String email;
  
  

  Disciplina({this.id, required this.nomeDisciplina});

  //Transformar dados no formato JSON em um objeto
  //da classe Pais
  factory Disciplina.fromJson(Map<String, dynamic> json, String id,) {
    return Disciplina(
        id : id,
        nomeDisciplina: json["disciplina"],
        
        //email: json["email"],
       
        );
  }
}
