class Product {
  late String nome;
  late String descricao;
  late String preco;
  String imagem = 'Abacaxi'; //imagem padrão
  bool favorito = false;

  Product(this.nome, this.descricao, this.preco, this.imagem);

  void changeState() {
    this.favorito = !favorito;
  }
}
