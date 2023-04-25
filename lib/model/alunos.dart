class Alunos {
  String id;
  String nome;
  //String curso;
  String email;
  String codigo;
  

  Alunos(this.id, this.nome, this.email, this.codigo);

  //Transformar dados no formato JSON em um objeto
  //da classe Pais
  factory Alunos.fromJson(String id,Map<String, dynamic> json) {
    return Alunos(
        id,
        json["nome"],
        //json["curso"],
        json["email"],
        json["codigo"]
        );
  }
}
