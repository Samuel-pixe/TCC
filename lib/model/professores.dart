class Professores {
  String? id;
  String nome;
  
  String email;
  
  

  Professores({this.id, required this.nome, required this.email});

  //Transformar dados no formato JSON em um objeto
  //da classe Pais
  factory Professores.fromJson(Map<String, dynamic> json, String id,) {
    return Professores(
        id : id,
        nome: json["nome"],
        
        email: json["email"],
       
        );
  }
}
